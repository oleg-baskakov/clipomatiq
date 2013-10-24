package com.clipomatiq.servlet;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.clipomatiq.db.DBProcessor;
import com.clipomatiq.youtube.YTEntry;

public class ProcessRequest {

	public static HashMap sids;

	static {
		sids = new HashMap();
	}

	public ProcessRequest() {
		// TODO Auto-generated constructor stub

	}

	public static String process(HttpServletRequest req) {

		String sid = req.getSession().getId();
		ClipomatiqSession csid;
		String result = null;
		if (sid == null)
			return null;
		if (!sids.containsKey(sid)) {
			csid = new ClipomatiqSession(sid);
			sids.put(sid, csid);
		}

		csid = (ClipomatiqSession) sids.get(sid);
		String cmd = (String) req.getParameter("commandId");

		if (cmd == null)
			return null;
		cmd = cmd.trim();
		if ("getNexClip".equalsIgnoreCase(cmd)) {
			result = getNextClip(csid);
		} else if ("toggleGenre".equalsIgnoreCase(cmd)) {
			String gId = req.getParameter("id");
			if (gId == null)
				return "";

			DBProcessor.updateGenreRating(gId);
			String[] genre = DBProcessor.getGenreByName(gId);
			csid.selectedGenries.clear();
			csid.selectedGenries.add(gId);
			System.out.println("select new genre=" + gId);
			// result=gId;
			req.setAttribute("toggleGenre", gId);
			YTEntry clip = null;
			clip = DBProcessor.getClip(csid.viewedClips, csid.lastArtistId, ""
					+ csid.selectedGenries.get(0));
			result = "";
			//String t = getT(clip.getId());
			if(clip!=null){
						result =clip.getId();
				csid.viewedClips.add(clip.getId());
				csid.lastConnect = System.currentTimeMillis();
				csid.lastArtistId = clip.artistId;
			}
			ArrayList clips = DBProcessor.getRndClips(csid.viewedClips, csid.lastArtistId, gId, 26);
			
			req.setAttribute("toggleGenre", gId);
			req.setAttribute("cliplink", result);
			req.setAttribute("clips", clips);
			
			
			
			if (genre != null) {
				req.setAttribute("genreInfo", genre[1]);
				req.setAttribute("genreName", genre[0]);
			}
			result = null;
			// result="<genreId>"+gId+"</genreId>";
		}
		return result;

	}

	private static String getNextClip(ClipomatiqSession csid) {
		String result;
		YTEntry clip = null;
		clip = DBProcessor.getClip(csid.viewedClips, csid.lastArtistId, ""
				+ csid.selectedGenries.get(0));
		result = "";
		String t = getT(clip.getId());
		result += "<link><description>" + clip.getTitle()
				+ "</description><videoId>" + clip.getId()
				+ "</videoId><t>" +t+
						"</t></link>";
		csid.viewedClips.add(clip.getId());
		csid.lastConnect = System.currentTimeMillis();
		csid.lastArtistId = clip.artistId;
		System.out.println("select next clip=" + result);
		return result;
	}

	private static String getT(String id) {
		// TODO Auto-generated method stub
		URL hp;
		try {
			hp = new URL(
					"http://www.youtube.com/get_video_info?el=embedded&ps=default&video_id="
							+ id);
			URLConnection hpCon = hp.openConnection();
			int len = hpCon.getContentLength();
			if (len == -1)
				System.out.println("Content length unavailable.");
//			else
//				System.out.println("Content-Length: " + len);
			int c;
			String result = "";
			if (len != 0) {
				InputStream input = hpCon.getInputStream();
				int i = len;
				DataInputStream ew = new DataInputStream(input);
				while (((ew.available()) > 0)) { // && (--i > 0)) {
					result += ew.readLine();
				}
				input.close();
				String[] results = result.split("&");
				if (result != null) {
					for (int j = 0; j < results.length; j++) {
						if (results[j].startsWith("token")) {
							String[] temp = results[j].split("=");
							if (temp != null)
								result = temp[1];
							break;
						}
					}
				}
			}

		//	System.out.println("" + result);
			return result;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	public static void main(String[] args) {
		getT("eGfHUMsrRtA");
	}

}
