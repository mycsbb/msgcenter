package com.csrc.msgcenter.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class TreeServlet
 */
public class TreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Pattern pattern = Pattern.compile("([\\-]*\\d+,)+");
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TreeServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		if (action == null) getTree(request, response);
		else if (action.equals("send")) {
			sendmsg(request, response);
		} else if (action.equals("queryByPhone")) {
			queryByPhone(request, response);
		} else if (action.equals("queryByContent")) {
			queryByContent(request, response);
		} else if (action.equals("update")) {
			updateUserInfo(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.write("<center><H1>404 not found!!</H1></center>");
			out.flush();
		}
	}
	
	private void updateUserInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		PrintWriter out = response.getWriter();
		if (password == null || password.equals("") || phone == null || phone.equals("")) {
			out.write("信息不能为空！");
			out.flush();
			return;
		}
		HttpSession httpSession = request .getSession();
		User cur_user = (User)httpSession.getAttribute(AuthFilter.USER_SESSION_KEY);
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		try{
			cur_user.setPassword(password);
			cur_user.setPhone(phone);
			int n = session.delete("User.update", cur_user); 
			session.commit();
			if (n > 0) {
				out.write("更新成功！");
			}
			else out.write("更新失败！");
			out.flush();
		}finally{
			session.close();
		}
	}

	private void queryByPhone(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String key = request.getParameter("key");
		if (key == null || key.equals("")) return;
		HttpSession httpSession = request .getSession();
		User cur_user = (User)httpSession.getAttribute(AuthFilter.USER_SESSION_KEY);
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("sender", cur_user.getUsername());
			paramMap.put("receiver", key);
			List<Message> msgList = session.selectList("Message.queryByPhone", paramMap);
			//生成json
			for (Message msg : msgList) {
				System.out.println(msg);
				json += messageToJson(msg) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
		}finally{
			session.close();
		}
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
	}
	
	

	private void queryByContent(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String key = request.getParameter("key");
		if (key == null || key.equals("")) return;
		HttpSession httpSession = request .getSession();
		User cur_user = (User)httpSession.getAttribute(AuthFilter.USER_SESSION_KEY);
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("sender", cur_user.getUsername());
			paramMap.put("content", key);
			List<Message> msgList = session.selectList("Message.queryByContent", paramMap);
			//生成json
			for (Message msg : msgList) {
				System.out.println(msg);
				json += messageToJson(msg) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
		}finally{
			session.close();
		}
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
	}

	protected void getTree(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try{
			
			List<Department> departments = session.selectList("Department.queryAll");
			List<User> users = session.selectList("User.queryAll");
			for (User user : users) {
				user.setId(user.getId() * (-1));
				json += userToJson(user) + ",";
			}
			for (Department department : departments) {
				json += departmentToJson(department) + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
		}finally{
			session.close();
		}
		//这句有用
		//这句没用
		//response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
	}
	
	private void sendmsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request .getSession();
		User cur_user = (User)httpSession.getAttribute(AuthFilter.USER_SESSION_KEY);
		
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String idstr = request.getParameter("idstr");
		String msg = request.getParameter("msg");
		System.out.println("idstr=" + idstr);
		PrintWriter out = response.getWriter();
		if (idstr == null) {
			out.write("发送失败！！");
		} else {
			Matcher matcher = pattern.matcher(idstr);
			if (matcher.matches()) {
				idstr = idstr.replaceAll("-", "");
				try{
					List<Integer> idlist = new ArrayList<Integer>();
					String id_strs[] = idstr.split(",");
					for (int i = 0; i < id_strs.length; i++) {
						idlist.add(Integer.parseInt(id_strs[i]));
					}
					List<String> phone_list = session.selectList("User.queryPhones", idlist);
					String phones = "";
					for (String phone : phone_list) {
						phones += phone + ",";
					}
					phones = phones.substring(0, phones.length() - 1);
					int phone_num = phones.split(",").length;
					if (phone_num < 1) {
						out.write("请填好信息接收人！！");
					} else {
						SmsClient.sendMessage(phones, msg);
						//把信息放入数据库
						String sender = cur_user.getUsername();
						String receiver = phones;
						String content = msg;
						Timestamp timestamp = new Timestamp(System.currentTimeMillis());
						Message message = new Message(sender, receiver, content, timestamp);
						session.insert("Message.insert", message);
						session.commit();
						//返回成功信息
						out.write("发送成功！！");
					} 
				}finally{
					session.close();
				}
			} else {
				out.write("发送失败！！");
			}
		}
		
		out.flush();
	}
	
	private String messageToJson(Message msg) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(Message.class.getName(), "sender");
		String str = JSONUtil.toJSON(msg, 0, false, filterMap, 1);
		
		return str;
	}
	
	public String userToJson(User user) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(User.class.getName(), "username,password,levelId,phone");
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
