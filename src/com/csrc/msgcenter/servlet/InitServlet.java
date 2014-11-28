package com.csrc.msgcenter.servlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csrc.msgcenter.filter.AuthFilter;

/**
 * Servlet implementation class InitServlet
 */
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @throws IOException 
     * @see HttpServlet#HttpServlet()
     */
    public InitServlet() throws IOException {
        super();
        
/*		String path = this.getClass().getResource("/").getPath();
		FileInputStream fis = new FileInputStream(path + "urls.permitted");
		InputStreamReader isr = new InputStreamReader(fis, "utf-8");
		BufferedReader br = new BufferedReader(isr);
		String line;
		while ((line = br.readLine()) != null) {
			if (!line.trim().equals("")) {
				System.out.println("init----------: " + line.trim());
				AuthFilter.urls_permitted.add(line.trim());
			}
		}*/
    }

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
