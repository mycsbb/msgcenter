package com.csrc.msgcenter.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.csrc.msgcenter.filter.AuthFilter;
import com.csrc.msgcenter.model.User;
import com.csrc.msgcenter.util.SessionUtil;

/**
 * Servlet implementation class AuthServlet
 */
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		doAuth(request, response);
	}

	private void doAuth(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpsession = request.getSession();
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username == null || username.equals("") || password == null || password.equals("")) {
			out.write("acount is null");
			out.flush();
			return;
		}
		SqlSession session = SessionUtil.getSessionFactory().openSession();
		try{
			User user = session.selectOne("User.queryByUsername", username);
			System.out.println(user);
			if (user != null && password.equals(user.getPassword())) {
				httpsession.setAttribute(AuthFilter.USER_SESSION_KEY, user);
				out.write("success");
				out.flush();
			} else {
				out.write("login fail, acount info error!!");
				out.flush();
			}
		}finally{
			session.close();
		}
	}

}
