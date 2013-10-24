package com.clipomatiq.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.clipomatiq.db.DBProcessor;
import com.clipomatiq.youtube.ClipFinder;
import com.clipomatiq.youtube.YTEntry;
import com.clipomatiq.youtube.YouTubeData;

/**
 * Servlet implementation class for Servlet: ProkrustClips
 *
 */
 public class ProkrustClips extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public ProkrustClips() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClipFinder cf = new ClipFinder();
		YouTubeData utube = new YouTubeData();
		String cmd=(String)request.getParameter("commandId");

		if(cmd!=null&&"delClips".equals(cmd)){
			String result=deleteClips((String)request.getParameter("clipId"));
			response.getWriter().print(result);
			response.flushBuffer();
			return;
		}else
			if(cmd!=null&&"delClip".equals(cmd)){
				String result=deleteClip((String)request.getParameter("clipId"));
				response.getWriter().print(result);
				response.flushBuffer();
				return;
		}else
			if(cmd!=null&&"slideshow".equals(cmd)){
				String result=setSlideshowClip((String)request.getParameter("clipId"));
				response.getWriter().print(result);
				response.flushBuffer();
				return;
		}

		String startStr= request.getParameter("start");
		String genreStr= request.getParameter("genre");
		int start=0;
		if(startStr!=null){
			start=Integer.parseInt(startStr);
		}
		int genreId=1;
		if(genreStr!=null){
			genreId=Integer.parseInt(genreStr);
		}
		utube.setEntries(DBProcessor.getClips(genreId, true,start));
		utube.setTotalACnt(cf.getTotalACount(utube.getEntries()));

		utube.setStartIndex(start);
		//cf.findClipsByName("Arctic Monkeys");
		request.setAttribute("utube", utube);
		
		RequestDispatcher rd = request.getRequestDispatcher("/procrust.jsp");
	        rd.forward(request, response);
	}  	
	
	private String deleteClip(String parameter) {
		String result="";
		if(parameter==null)return "";
		int gid=Integer.parseInt(parameter);
		int count = DBProcessor.removeClip(gid);
		result=""+count;
		return result;
	}

	private String setSlideshowClip(String parameter) {
		String result="";
		if(parameter==null)return "";
		int count = DBProcessor.updateClipRating(parameter, 1);
		result=""+count;
		return result;
	}

	private String deleteClips(String parameter) {
		String result="";
		if(parameter==null)return "";
		int count = DBProcessor.removeClips(parameter);
		result=""+count;
		return result;
	}
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   	  	    
}