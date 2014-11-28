package com.csrc.msgcenter.filter;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

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
	public static List<String> urls_permitted = new ArrayList<String>();
	public String GOING_IN = "Enter AuthInterceptor.";
	public String GOING_OUT = "Go out AuthInterceptor.";

	static {
		String path = "";
		try {
			path = AuthFilter.class.getResource("/").toURI().getPath();
		} catch (URISyntaxException e1) {
			e1.printStackTrace();
		}
		System.out.println("path: " + path + "urls.permitted");
		try {
			FileInputStream fis = new FileInputStream(path + "urls.permitted");
			InputStreamReader isr = new InputStreamReader(fis, "utf-8");
			BufferedReader br = new BufferedReader(isr);
			String line;
			while ((line = br.readLine()) != null) {
				if (!line.trim().equals("")) {
					System.out.println("init----------: " + line.trim());
					AuthFilter.urls_permitted.add(line.trim());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

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

		int flag = 0;
		for (int i = 0; i < urls_permitted.size(); i++) {
			String url = urls_permitted.get(i);
			if (url.endsWith("*")) {
				if (servletPath.startsWith(url.replace("*", ""))) {
					flag = 1;
					break;
				}
			} else if (servletPath.equals(url)) {
				flag = 1;
				break;
			}
		}
		if (flag == 0) {
			request.getRequestDispatcher("/404.jsp").forward(req, res);
			return;
		}

		String action = request.getParameter("action");
		if (reqType.equalsIgnoreCase("post") && servletPath.equals("/auth")) {
			if (session != null
					&& session.getAttribute(USER_SESSION_KEY) != null) {
				System.out.println("[login-post-has-session]");
				request.getRequestDispatcher("/index.jsp").forward(req, res);
				System.out.println(GOING_OUT);
			} else {
				chain.doFilter(req, res);
			}
			return;
		}

		if (reqType.equalsIgnoreCase("get") && servletPath.equals("/auth")) {
			if (session != null
					&& session.getAttribute(USER_SESSION_KEY) != null) {
				if (action != null && action.equals("logout")) {
					session.removeAttribute(USER_SESSION_KEY);
					response.sendRedirect(request.getContextPath()
							+ "/login.html");
				} else {
					System.out.println("[has-session]");
					request.getRequestDispatcher("/index.jsp")
							.forward(req, res);
					System.out.println(GOING_OUT);
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/login.html");
			}
			return;
		}

		if (session != null && session.getAttribute(USER_SESSION_KEY) != null) {
			System.out.println("[login-post-has-session]");
			if (servletPath.endsWith(".html")) {
				request.getRequestDispatcher(
						servletPath.replace(".html", ".jsp")).forward(req, res);
			} else if (servletPath.equals("/")) {
				request.getRequestDispatcher("/index.jsp").forward(req, res);
			} else {
				chain.doFilter(req, res);
			}
			System.out.println(GOING_OUT);
		} else {
			if (servletPath.startsWith("/js/")
					|| servletPath.startsWith("/css/")
					|| servletPath.startsWith("/test/")) {
				chain.doFilter(req, res);
			} else if (servletPath.equals("/login.html")
					|| servletPath.equals("/")) {
				request.getRequestDispatcher("/login.jsp").forward(req, res);
			} else if (servletPath.equals("/index.html")) {
				response.sendRedirect(request.getContextPath() + "/login.html");
			} else {
				request.getRequestDispatcher("/expired.jsp").forward(req, res);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
