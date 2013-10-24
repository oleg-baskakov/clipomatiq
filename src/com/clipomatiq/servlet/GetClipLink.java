package com.clipomatiq.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class for Servlet: GetClipLink
 *
 */
 public class GetClipLink extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public GetClipLink() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	System.out.println(request.getSession().getId());
		String cmd=(String)request.getParameter("commandId");
		
		if(cmd!=null)
			System.out.println("cmd is "+cmd);
		else 
			System.out.println("cmd is null");
		String result = ProcessRequest.process(request);
		if(result==null){
			//result="<link></link>";
			  getServletConfig().getServletContext().getRequestDispatcher(
		        "/rebirth.jsp").forward(request,response);
		}
	////	String result="<link><description>Link to cool clip</description><videoId>e_iDL4Z_5uA</videoId><t>OEgsToPDskKzBwAeCF3fRxFX3fWtktiw</t></link>";
	//	System.out.println("outp="+result);
		response.getWriter().print(result);
		response.flushBuffer();
	
	}   	  	    
}