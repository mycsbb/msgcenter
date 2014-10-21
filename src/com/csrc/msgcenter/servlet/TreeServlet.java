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

import org.apache.ibatis.session.SqlSession;

import com.csrc.msgcenter.model.Department;
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
		} else {
			PrintWriter out = response.getWriter();
			out.write("<center><H1>404 not found!!</H1></center>");
			out.flush();
		}
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
				SqlSession session = SessionUtil.getSessionFactory().openSession();
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
					} else if (phone_num == 1) {
						SmsClient.sendMessage(phones, msg);
						out.write("发送成功！！");
					} else {
						SmsClient.sendMorephoneMessage(phones, msg);
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
