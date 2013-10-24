package com.clipomatiq.servlet;

import java.util.ArrayList;
import java.util.HashMap;

public class ClipomatiqSession {

	
	public ArrayList selectedGenries;
	public String sid;
	public String userAgent;
	public long lastConnect;
	public int lastArtistId;
	public ArrayList viewedClips;
	
	public ClipomatiqSession(String sid) {
		// TODO Auto-generated constructor stub
		viewedClips= new ArrayList();
		selectedGenries= new ArrayList();
		selectedGenries.add("2");
		lastConnect=System.currentTimeMillis();
		this.sid = sid;
	}

}
