/*======================
 	Test1.java
======================*/

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		/* ①번째 테스트 (정적) : 박민지
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : "+ "박민지" +"</h1>");
		pw.println("<h1>age : "+ "13" +"</h1>");
		pw.println("</body></html>");
		*/
		
		/* ②번째 테스트 변수로 값 넣어주기 : 선혜연
		String name = "선혜연";
		String age = "13";
		
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : "+ name +"</h1>");
		pw.println("<h1>age : "+ age +"</h1>");
		pw.println("</body></html>");
		*/
		
		/* ③번째 『web.xml』에 『<init-param>』 추가 : 심혜진
		
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화 할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : "+ name +"</h1>");
		pw.println("<h1>age : "+ age +"</h1>");
		pw.println("</body></html>");
		*/
		
		// ④ 번째 『web.xml』에 『<content-param>』 추가 :
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		// 서블릿이 제공하는 컨텐츠 관리 객체
		ServletContext context = getServletContext();		
		String type = context.getInitParameter("type");
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : "+ name +"</h1>");
		pw.println("<h1>age : "+ age +"</h1>");		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</body></html>");
	}
	
}
