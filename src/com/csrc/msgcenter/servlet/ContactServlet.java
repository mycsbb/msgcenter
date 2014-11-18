package com.csrc.msgcenter.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.csrc.msgcenter.model.Contact;
import com.csrc.msgcenter.model.User;
import com.csrc.msgcenter.util.JSONUtil;
import com.csrc.msgcenter.util.SessionUtil;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		if (action == null)
			queryAllContacts(request, response);
		else if (action.equals("insert")) {
			insertContact(request, response);
		} else if (action.equals("queryLikeZhname")) {
			queryLikeZhname(request, response);
		} else if (action.equals("update")) {
			updateContact(request, response);
		} else if (action.equals("delete")) {
			deleteContacts(request, response);
		} else if (action.equals("fetchcontact")) {
			queryById(request, response);
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
		try{
			Contact qcontact = session.selectOne("Contact.queryById", id);
			if (qcontact == null) {
				out.write("数据库可能有变！");
				out.flush();
				return;
			}
			String str = contactToJson(qcontact, "userId");
			out.write(str);
			out.flush();
		}finally{
			session.close();
		}
	}

	private void deleteContacts(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		
		String idstr = request.getParameter("idstr");
		System.out.println("idstr=" + idstr);
		if (idstr == null || idstr.trim().equals("")) {
			out.write("请重新选择要删除的联系人！！");
			out.flush();
		} else {
			Pattern pattern = Pattern.compile("(\\d+,)*\\d+");
			Matcher matcher = pattern.matcher(idstr);
			if (matcher.matches()) {
				try{
					List<Integer> idlist = new ArrayList<Integer>();
					String id_strs[] = idstr.split(",");
					for (int i = 0; i < id_strs.length; i++) {
						idlist.add(Integer.parseInt(id_strs[i]));
					}
					int n = session.delete("Contact.deleteContacts", idlist);
					session.commit();
					System.out.println("[Contact_delete] n条记录受影响：" + n);
					if (n > 0) {
						out.write("delete_success");
					} else {
						out.write("删除失败！");
					}
					out.flush();
				}finally{
					session.close();
				}
			} else {
				out.write("请重新选择要删除的联系人！！");
				out.flush();
			}
		}
	}

	private void updateContact(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		String id_str = request.getParameter("id");
		String zhname = request.getParameter("zhname");
		String phone = request.getParameter("phone");
		if (id_str == null || id_str.trim().equals("") || 
				zhname == null || zhname.trim().equals("") || 
				phone == null || phone.trim().equals("")) {
			out.write("字段信息不能为空！");
			out.flush();
			return;
		}

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

		regex = "^[1-9]{1}\\d*$";
		pattern = Pattern.compile(regex);
		matcher = pattern.matcher(id_str);
		if (!matcher.matches()) {
			out.write("请重新选择所要更改的用户！");
			out.flush();
			return;
		}
		int id = Integer.parseInt(id_str);

		SqlSession session = SessionUtil.getSessionFactory().openSession();
		Contact qcontact;
		try {
			qcontact = session.selectOne("Contact.queryById", id);
			if (qcontact == null) {
				out.write("联系人不存在！数据库有可能已经发生改变");
				out.flush();
				return;
			}
			qcontact.setPhone(phone);
			qcontact.setZhname(zhname);
			int n = session.update("Contact.update", qcontact);
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

	private void queryLikeZhname(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String zhname = request.getParameter("zhname");

		PrintWriter out = response.getWriter();
		if (zhname == null || zhname.trim().equals("")) {
			out.write("字段信息不能为空！");
			out.flush();
			return;
		}

		zhname = zhname.trim();

		HttpSession httpSession = request.getSession();
		User cur_user = (User) httpSession
				.getAttribute(AuthFilter.USER_SESSION_KEY);

		SqlSession session = SessionUtil.getSessionFactory().openSession();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", cur_user.getId());
			paramMap.put("zhname", zhname);
			List<Contact> contacts = session.selectList(
					"Contact.queryLikeZhname", paramMap);
			String json = "";
			for (Contact contact : contacts) {
				json += contactToJson(contact, "userId") + ",";
			}
			if (json != "") {
				json = "[" + json.substring(0, json.length() - 1) + "]";
				System.out.println(json);
			}
			out.write(json);
			out.flush();
		} finally {
			session.close();
		}
	}

	private void insertContact(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String zhname = request.getParameter("zhname");
		String phone = request.getParameter("phone");

		PrintWriter out = response.getWriter();
		if (zhname == null || zhname.equals("") || phone == null
				|| phone.equals("")) {
			out.write("字段信息不能为空！");
			out.flush();
			return;
		}

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

		HttpSession httpSession = request.getSession();
		User cur_user = (User) httpSession
				.getAttribute(AuthFilter.USER_SESSION_KEY);
		Contact contact = new Contact(cur_user.getId(), phone, zhname);

		SqlSession session = SessionUtil.getSessionFactory().openSession();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", cur_user.getId());
			paramMap.put("zhname", zhname);
			Contact qcontact = session.selectOne("Contact.queryByZhname",
					paramMap);
			if (qcontact != null) {
				out.write("该联系人已经存在！");
				out.flush();
				return;
			}
			int n = session.insert("Contact.insert", contact);
			session.commit();
			System.out.println("[contact_insert] n条记录受影响：" + n);
			if (n > 0) {
				out.write("add_success");
			} else
				out.write("添加失败！");
			out.flush();
		} finally {
			session.close();
		}
	}

	private void queryAllContacts(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		String json = "";
		try {
			List<Contact> contacts = session.selectList("Contact.queryAll");
			for (Contact contact : contacts) {
				json += contactToJson(contact, "userId") + ",";
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

	public String contactToJson(Contact contact, String filter_field) {
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put(Contact.class.getName(), filter_field);
		String str = JSONUtil.toJSON(contact, 0, false, filterMap, 1);

		return str;
	}
}
