package com.csrc.msgcenter.filter;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthFilter
 */
public class AuthFilter implements Filter {
	public static final String USER_SESSION_KEY = "MsgCenterUser";
	public static final String COOKIE_REMEMBERME_KEY = "aicaCookie";
	public static final String GOING_TO_INFO_KEY = "GOING_TO";
	public static boolean isNeedAuth = true;
	public String GOING_IN = "Enter AuthInterceptor.";
	public String GOING_OUT = "Go out AuthInterceptor.";

	/**
	 * Default constructor.
	 */
	public AuthFilter() {
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		System.out.println("enter filter...");
		
		if (!isNeedAuth) {
			chain.doFilter(req, res);
			System.out.println(GOING_OUT);
			return;
		}

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();

		String servletPath = request.getServletPath();
		String reqType = request.getMethod();

		System.out.println("servletPath=" + servletPath);
		
		String action = request.getParameter("action");
		if (reqType.equalsIgnoreCase("post") && servletPath.equals("/auth")) {
			if (session != null && session.getAttribute(USER_SESSION_KEY) != null) {
				System.out.println("[login-post-has-session]");
				request.getRequestDispatcher("/index.jsp").forward(req, res);
				System.out.println(GOING_OUT);
			} else {
				chain.doFilter(req, res);
			}
			return;
		}
		
		if (reqType.equalsIgnoreCase("get") && servletPath.equals("/auth")) {
			if (session != null && session.getAttribute(USER_SESSION_KEY) != null) {
				if (action != null && action.equals("logout")) {
					session.removeAttribute(USER_SESSION_KEY);
					response.sendRedirect(request.getContextPath() + "/login.html");
				} else {
					System.out.println("[has-session]");
					request.getRequestDispatcher("/index.jsp").forward(req, res);
					System.out.println(GOING_OUT);
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/login.html");
			}
			return;
		}
		
		if (session != null && session.getAttribute(USER_SESSION_KEY) != null) {
			System.out.println("[login-post-has-session]");
			chain.doFilter(req, res);
			System.out.println(GOING_OUT);
		} else {
			if (servletPath.startsWith("/js/") || servletPath.startsWith("/css/") || 
					servletPath.startsWith("/test/")) {
				chain.doFilter(req, res);
			} else if (servletPath.equals("/login.html") || servletPath.equals("/")) {
				request.getRequestDispatcher("/login.jsp").forward(req, res);
			} else if (servletPath.equals("/index.html") || servletPath.equals("/index.jsp")) {
				response.sendRedirect(request.getContextPath() + "/login.html");
			} else {
				request.getRequestDispatcher("/404.jsp").forward(req, res);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
