package com.csrc.msgcenter.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.csrc.msgcenter.filter.AuthFilter;
import com.csrc.msgcenter.model.Department;
import com.csrc.msgcenter.model.Message;
import com.csrc.msgcenter.model.User;
import com.csrc.msgcenter.util.JSONUtil;
import com.csrc.msgcenter.util.SessionUtil;
import com.csrc.msgcenter.webservice.SmsClient;
import com.sms.webservice.client.SmsReturnObj;

/**
 * Servlet implementation class TreeServlet
 */
public class TreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TreeServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		if (action == null)
			getTree(request, response);
		else if (action.equals("send")) {
			sendmsg(request, response);
		} else if (action.equals("queryByPhone")) {
			queryByPhone(request, response);
		} else if (action.equals("queryByContent")) {
			queryByContent(request, response);
		} else if (action.equals("update_personal")) {
			updatePersonalInfo(request, response);
		} else if (action.equals("update_user")) {
			updateUserInfo(request, response);
		} else if (action.equals("insert")) {
			insertUser(request, response);
		} else if (action.equals("delete")) {
			deleteUsers(request, response);
		} else if (action.equals("fetchuser")) {
			queryById(request, response);
		} else if (action.equals("usermgr")) {
			do_usermgr(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.write("<center><H1>404 not found!!</H1></center>");
			out.flush();
		}
	}

	private void queryById(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		SqlSession session = SessionUtil.getSessionFactory().openSession();

		String id_str = request.getParameter("id");
		System.out.println("id_str=" + id_str);
		if (id_str == null || id_str.trim().equals("")) {
			out.write("字段信息不能为空！！");
			out.flush();
			return;
		}
		String regex = "^[1-9]{1}\\d*$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(id_str);
		if (!matcher.matches()) {
			out.write("数据格式不正确！");
			out.flush();
			return;
		}
		int id = Integer.parseInt(id_str);
		try {
			User quser = session.selectOne("User.queryById", id);
			if (quser == null) {
				out.write("数据库可能有变！");
				out.flush();
				return;
			}
			String str = userToJson(quser, "role,password");
			out.write(str);
			out.flush();
		} finally {
			session.close();
		}
	}

	private void deleteUsers(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		SqlSession session = SessionUtil.getSessionFactory().openSession();

		String idstr = request.getParameter("idstr");
		System.out.println("idstr=" + idstr);
		if (idstr == null || idstr.trim().equals("")) {
			out.write("请重新选择要删除的人！！");
			out.flush();
		} else {
			Pattern pattern = Pattern.compile("(\\-\\d+,)*\\-\\d+");
			Matcher matcher = pattern.matcher(idstr);
			if (matcher.matches()) {
				idstr = idstr.replaceAll("-", "");
				try {
					List<Integer> idlist = new ArrayList<Integer>();
					String id_strs[] = idstr.split(",");
					for (int i = 0; i < id_strs.length; i++) {
						idlist.add(Integer.parseInt(id_strs[i]));
					}
					int n = session.delete("User.deleteUsers", idlist);
					session.commit();
					System.out.println("删除操作n条记录受影响：" + n);
					if (n > 0) {
						out.write("delete_success");
					} else {
						out.write("删除失败！");
					}
					out.flush();
				} finally {
					session.close();
				}
			} else {
				out.write("请重新选择要删除的人！！");
				out.flush();
			}
		}
	}

	private void insertUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String departId_str = request.getParameter("departId");
		String levelId_str = request.getParameter("levelId");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String zhname = request.getParameter("zhname");
		String phone = request.getParameter("phone");

		PrintWriter out = response.getWriter();
		if (departId_str == null || departId_str.trim().equals("")
				|| username == null || username.trim().equals("")
				|| password == null || password.trim().equals("")
				|| zhname == null || zhname.trim().equals("") || phone == null
				|| phone.trim().equals("")) {
			out.write("用户字段信息不能为空！");
			out.flush();
			return;
		}

		departId_str = departId_str.trim();
		if (levelId_str != null) {
			levelId_str = levelId_str.trim();
		} else {
			levelId_str = "100";
		}

		username = username.trim();
		password = password.trim();
		zhname = zhname.trim();
		phone = phone.trim();

		// 下面验证手机格式
		String regex = "^\\d+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(phone);
		if (!matcher.matches()) {
			out.write("手机格式不正确！");
			out.flush();
			return;
		}

		regex = "[1-9]+\\d*";
		pattern = Pattern.compile(regex);
		matcher = pattern.matcher(departId_str);
		if (!matcher.matches()) {
			out.write("部门格式不正确！");
			out.flush();
			return;
		}
		int departId = Integer.parseInt(departId_str);

		matcher = pattern.matcher(levelId_str);
		if (!matcher.matches()) {
			out.write("职务格式不正确！");
			out.flush();
			return;
		}
		int levelId = Integer.parseInt(levelId_str);

		// 表示普通用户
		int role = 1;
		User user = new User(username, password, departId, levelId, zhname,
				phone, role);

		SqlSession session = SessionUtil.getSessionFactory().openSession();
		try {
			User quser = session.selectOne("User.queryByUsername", username);
			if (quser != null) {
				out.write("用户名已经存在！");
				out.flush();
				return;
			}
			int n = session.insert("User.insert", user);
			System.out.println("添加之前user.id: " + user.getId());
			session.commit();
			System.out.println("添加之后user.id: " + user.getId());
			System.out.println("n条记录受影响：" + n);
			if (n > 0) {
				out.write("add_success");
			} else
				out.write("添加失败！");
			out.flush();
		} finally {
			session.close();
		}
	}

	private void updatePersonalInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String pwd_flag = request.getParameter("pwd_flag");
		PrintWriter out = response.getWriter();
		if (password == null || password.trim().equals("") || phone == null
				|| phone.trim().equals("")
				|| pwd_flag == null || pwd_flag.trim().equals("")) {
			out.write("信息不能为空！");
			out.flush();
			return;
		}
		// 下面验证手机格式
		String regex = "^[1-9]{1}\\d{3,10}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(phone);
		if (!matcher.matches()) {
			out.write("手机格式不正确！");
			out.flush();
			return;
		}
		
		
		regex = "^[0-1]{1}$";
		pattern = Pattern.compile(regex);
		matcher = pattern.matcher(pwd_flag);
		if (!matcher.matches()) {
			out.write("信息不正确！");
			out.flush();
			return;
		}
		HttpSession httpSession = request.getSession();
		User cur_user = (User) httpSession
				.getAttribute(AuthFilter.USER_SESSION_KEY);
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		try {
			if (Integer.parseInt(pwd_flag) == 1) {
				cur_user.setPassword(password);
			}
			cur_user.setPhone(phone);
			int n = session.update("User.update_personal", cur_user);
			session.commit();
			if (n > 0) {
				out.write("update_success");
			} else
				out.write("更新失败！");
			out.flush();
		} finally {
			session.close();
		}
	}

	private void updateUserInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		String id_str = request.getParameter("id");
		String departId_str = request.getParameter("departId");
		String levelId_str = request.getParameter("levelId");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String zhname = request.getParameter("zhname");
		String phone = request.getParameter("phone");
		if (id_str == null || id_str.trim().equals("") || departId_str == null
				|| departId_str.trim().equals("") || username == null
				|| username.trim().equals("") || password == null
				|| password.trim().equals("") || zhname == null
				|| zhname.trim().equals("") || phone == null
				|| phone.trim().equals("")) {
			out.write("用户字段信息不能为空！");
			out.flush();
			return;
		}

		departId_str = departId_str.trim();
		if (levelId_str != null) {
			levelId_str = levelId_str.trim();
		} else {
			levelId_str = "100";
		}

		username = username.trim();
		password = password.trim();
		zhname = zhname.trim();
		phone = phone.trim();

		// 下面验证手机格式
		String regex = "^[1-9]{1}\\d{3,10}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(phone);
		if (!matcher.matches()) {
			out.write("手机格式不正确！");
			out.flush();
			return;
		}

		regex = "^[1-9]{1}\\d*$";
		pattern = Pattern.compile(regex);
		matcher = pattern.matcher(id_str);
		if (!matcher.matches()) {
			out.write("请重新选择所要更改的用户！");
			out.flush();
			return;
		}
		int id = Integer.parseInt(id_str);

		regex = "[1-9]+\\d*";
		pattern = Pattern.compile(regex);
		matcher = pattern.matcher(departId_str);
		if (!matcher.matches()) {
			out.write("部门格式不正确！");
			out.flush();
			return;
		}
		int departId = Integer.parseInt(departId_str);

		matcher = pattern.matcher(levelId_str);
		if (!matcher.matches()) {
			out.write("职位格式不正确！");
			out.flush();
			return;
		}
		int levelId = Integer.parseInt(levelId_str);

		SqlSession session = SessionUtil.getSessionFactory().openSession();
		User quser;
		try {
			quser = session.selectOne("User.queryById", id);
			if (quser == null) {
				out.write("用户不存在！数据库有可能已经发生改变");
				out.flush();
				return;
			}
			quser.setDepartId(departId);
			quser.setLevelId(levelId);
			quser.setPassword(password);
			quser.setPhone(phone);
			quser.setUsername(username);
			quser.setZhname(zhname);
			int n = session.update("User.update_user", quser);
			session.commit();
			if (n > 0) {
				out.write("update_success");
			} else
				out.write("更新失败！");
			out.flush();
		} finally {
			session.close();
		}
	}

	private void queryByPhone(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		String key = request.getParameter("key");
		key = URLDecoder.decode(key, "utf-8");
		System.out.println("key=" + key);
		if (key == null || key.trim().equals(""))
			return;
		String regex = "^\\d+$";
		Pattern phone_pattern = Pattern.compile(regex);
		Matcher matcher = phone_pattern.matcher(key);
		if (!matcher.matches()) {
			out.write("手机格式不正确！");
			out.flush();
			return;
		}

		HttpSession httpSession = request.getSession();
		User cur_user = (User) httpSession
				.getAttribute(AuthFilter.USER_SESSION_KEY);
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", cur_user.getId());
			paramMap.put("receiver", key);
			List<Message> msgList = session.selectList("Message.queryByPhone",
					paramMap);
			// 生成json
			for (Message msg : msgList) {
				System.out.println(msg);
				json += messageToJson(msg) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
		} finally {
			session.close();
		}
		out.write(json);
		out.flush();
	}

	private void queryByContent(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String key = request.getParameter("key");
		if (key == null || key.trim().equals(""))
			return;
		key = URLDecoder.decode(key, "utf-8");
		System.out.println("key=" + key);
		HttpSession httpSession = request.getSession();
		User cur_user = (User) httpSession
				.getAttribute(AuthFilter.USER_SESSION_KEY);
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", cur_user.getId());
			paramMap.put("content", key);
			List<Message> msgList = session.selectList(
					"Message.queryByContent", paramMap);
			// 生成json
			for (Message msg : msgList) {
				System.out.println(msg);
				json += messageToJson(msg) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
		} finally {
			session.close();
		}
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
	}

	protected void getTree(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try {
			List<Department> departments = session
					.selectList("Department.queryAll");
			List<User> users = session.selectList("User.queryAll");
			for (User user : users) {
				user.setId(user.getId() * (-1));
				json += userToJson(user, "username,password,levelId,phone")
						+ ",";
			}
			for (Department department : departments) {
				json += departmentToJson(department) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
		} finally {
			session.close();
		}
		// 这句有用
		// 这句没用
		// response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
	}
	
	protected void do_usermgr(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try {
			List<Department> departments = session
					.selectList("Department.queryAll");
			List<User> users = session.selectList("User.queryAll");
			for (User user : users) {
				user.setId(user.getId() * (-1));
				json += userToJson(user, "username,password,levelId,phone")
						+ ",";
			}
			for (Department department : departments) {
				json += departmentToJson(department) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
			
			request.setAttribute("zNodes", json);
			request.getRequestDispatcher("/usermgr.jsp").forward(request, response);
		} finally {
			session.close();
		}
		// 这句有用
		// 这句没用
		// response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
	}

	private void sendmsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession httpSession = request.getSession();
		User cur_user = (User) httpSession
				.getAttribute(AuthFilter.USER_SESSION_KEY);
		if (cur_user == null) {
			out.write("请先登录！！");
			out.flush();
			return;
		}
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String idstr = request.getParameter("idstr");
		String phone_str = request.getParameter("phone_str");
		String msg = request.getParameter("msg");
		msg = URLDecoder.decode(msg, "utf-8");
		System.out.println("msg=" + msg);
		if (msg == null || msg.trim().equals("")) {
			out.write("信息不能为空！！");
			out.flush();
		}
		System.out.println("idstr=" + idstr);

		if ((idstr == null || idstr.trim().equals(""))
				&& (phone_str == null || phone_str.trim().equals(""))) {
			out.write("接收人有误！！");
			out.flush();
			return;
		}

		Pattern pattern = Pattern.compile("([\\-]*\\d+,)+");
		Matcher matcher = pattern.matcher(idstr);
		if (idstr != null && !idstr.trim().equals("") && !matcher.matches()) {
			out.write("收信人格式不正确！！");
			out.flush();
			return;
		}
		pattern = Pattern.compile("([1-9]{1}\\d*,)+");
		matcher = pattern.matcher(phone_str);
		if (phone_str != null && !phone_str.trim().equals("")
				&& !matcher.matches()) {
			out.write("收信人格式不正确！！");
			out.flush();
			return;
		}
		
		String phones = "";
		if (idstr != null && !idstr.trim().equals("")) {
			try {
				List<Integer> idlist = new ArrayList<Integer>();
				idstr = idstr.replace("-", "");
				String id_strs[] = idstr.split(",");
				for (int i = 0; i < id_strs.length; i++) {
					idlist.add(Integer.parseInt(id_strs[i]));
				}
				List<String> phone_list = session.selectList(
						"User.queryPhones", idlist);
				for (String phone : phone_list) {
					phones += phone + ",";
				}
			} finally {
				session.close();
			}
		}
		if (phone_str != null && !phone_str.trim().equals("")) {
			phones = phones + "" + phone_str;
		}
		System.out.println("phones: " + phones);
		phones = phones.substring(0, phones.length() - 1);
		
		if (!phones.equals("")) {
			try {
				SmsReturnObj retObj = SmsClient.sendMessage(phones, msg);
				if (retObj.getReturnCode() != 1) {
					out.write("短信发送失败，原因为：" + retObj.getReturnMsg());
					out.flush();
				} else {
					System.out.println("短信发送成功！返回结果为：" + retObj.getReturnMsg());
					// 把信息放入数据库
					Integer userId = cur_user.getId();
					String receiver = phones;
					String content = msg;
					Timestamp timestamp = new Timestamp(System.currentTimeMillis());
					session = SessionUtil.getSessionFactory().openSession();
					try {
						Message message = new Message(userId, receiver, content,
								timestamp);
						session.insert("Message.insert", message);
						session.commit();
					} finally {
						session.close();
					}
					out.write("发送成功！！");
					out.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
				out.write("发送过程发生异常！！");
				out.flush();
			}
		} else {
			out.write("请重新选择收信人！！");
			out.flush();
		}
	}

	private String messageToJson(Message msg) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(Message.class.getName(), "sender");
		String str = JSONUtil.toJSON(msg, 0, false, filterMap, 1);

		return str;
	}

	public String userToJson(User user, String filter_field) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(User.class.getName(), filter_field);
		String str = JSONUtil.toJSON(user, 0, false, filterMap, 1);
		str = str.substring(0, str.length() - 1) + ", \"is_person\": true}";
		str = str.replace("departId", "pId");
		str = str.replace("zhname", "name");

		return str;
	}

	public String departmentToJson(Department department) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(User.class.getName(), "rank");
		String str = JSONUtil.toJSON(department, 0, false, filterMap, 1);
		str = str.substring(0, str.length() - 1) + ", \"open\": true}";
		str = str.replace("pid", "pId");

		return str;
	}

}
