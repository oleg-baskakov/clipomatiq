<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, com.clipomatiq.youtube.*, com.clipomatiq.Genre, com.clipomatiq.db.DBProcessor,com.clipomatiq.ClipomatiqInside"%>
<%!int total = DBProcessor.getTotalClips();
	ArrayList genries = DBProcessor.getGenries();
	int maxminRate[] = DBProcessor.getMinMaxRate4Genre();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String tI = (String) request.getAttribute("toggleGenre");
	String gInfo = (String) request.getAttribute("genreInfo");
	String gName = (String) request.getAttribute("genreName");
	String label = gName;
	if (tI == null)
		tI = "";

	if (gInfo == null)
		gInfo = "";
	if (gName == null) {
		gName = "";
		label = "Music";
	}

	int calculatedRate = maxminRate[0] - maxminRate[1];
	if (calculatedRate <= 0) {
		calculatedRate = 1;
	}
%>
<meta name="description" content="Free music video channels. New music webtv. <%=gName%> music">
  <meta name="keywords"
    content="free <%=gName%> videos, online <%=gName%> music,<%=gName%>,<%=gName%> music video,<%=gName%> music videos,<%=gName%> music tv,<%=gName%> videos, <%=gName%> clips, clipomatiq">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/style.css" rel="stylesheet" type="text/css" />
<title>Clipomatiq <%=gName%></title>

<script>
	function setVideo(videoLink) {
		document.all.item('more').innerHTML = '<embed src="http://www.youtube.com/v/'+videoLink+'&fs=1&" type="application/x-shockwave-flash"	 		allowscriptaccess="always" allowfullscreen="true" width="425" height="344">	 	</embed>	';


	}
</script>
</head>

<body>
  <!--header paer start -->
  <div id="headerPan">
    <a href="http://<%=pageContext.getRequest().getServerName()%>"><img src="../images/header_pic.jpg" alt="Clipomatiq" /> </a>
    <ul>

      <li style="color: white">Total videos <%=total%></li>
    </ul>

  </div>
  <h4 style="color: white">
    <%=label%>
    videos machine
  </h4>
  <!--header part end -->
  <!--body part start -->
  <div id="mainBody">

    <!--left side start -->
    <div id="leftPan">

      <%
      	ArrayList clips = (ArrayList) request.getAttribute("clips");
      	if (clips == null) {
      		clips = DBProcessor.getRndClips(26);
      		request.setAttribute("toggleGenre", "");
      	}
      	int size;
      	YTEntry clip;
      	boolean flipper;
      	String cliplink = (String) request.getAttribute("cliplink");

      	if (request.getAttribute("toggleGenre") != null) {
      %>

      <table>
        <%
        	size = clips.size() > 6 ? 6 : clips.size();
        		for (int i = 0; i < size; i++) {
        			clip = (YTEntry) clips.get(i);
        			if (clip == null)
        				continue;

        			if (i % 2 == 0) {
        				if (i > 0) {
        %>
        </tr>
        <%
        	}
        %>
        <tr>
          <%
          	}
          %>
          <td>
            <div id="thumb">
              <h4><%=clip.getTitle()%></h4>
              <p>
                <a href="#" onclick="setVideo('<%=clip.getId()%>');return false;"> <img src="<%=clip.getThumb()%>" />
                </a>
              </p>
            </div>
          </td>

          <%
          	}
          %>
      </table>
      <%
      	}
      %>

      <br/>
        <h3><%=gName%></h3> 
        <%--
 	if(request.getAttribute("toggleGenre")!=null){
 --%>
        <p id="pGenries">
          <%
          	Genre genre;
          	int fontSize = 1;
          	int FONT_MAX_SIZE = 30;
          	//	String cliplink=(String)request.getAttribute("cliplink");
          	for (int i = 0; i < genries.size(); i++) {
          		genre = (Genre) genries.get(i);
          %>
          <a
            style="font-size: <%=(genre.reqCount - maxminRate[1]) * FONT_MAX_SIZE
						/ (calculatedRate) + 8%>px; <%=tI.equals("" + genre.id) ? "color:blue" : ""%> "
            id='gId<%=genre.id%>' class="more"
            href="/MusicVideos/<%=genre.name.replaceAll(" ", "")%>.videos?commandId=toggleGenre&id=<%=genre.id%>"><%=genre.name%></a>
          <%
          	}
          %>
        </p> 
        <%--
 	}
 --%>
      
    </div>
    <!--left side end -->
    <!--right side start -->
    <div id="rightPan">
      <table>
        <%
        	size = clips.size() > 8 ? 8 : clips.size();
        	for (int i = 6; i < size; i++) {
        		clip = (YTEntry) clips.get(i);
        		if (clip == null)
        			continue;

        		if (i % 2 == 0) {
        			if (i > 0) {
        %>
        </tr>
        <%
                	}
                	flipper = true;
        %>
        <tr>
          <%
             	}
          %>
          <td>
            <div id="thumb">
              <h4><%=clip.getTitle()%></h4>
              <p>
                <a href="#" onclick="setVideo('<%=clip.getId()%>');return false;"> <img src="<%=clip.getThumb()%>" />
                </a>
              </p>
            </div>
          </td>
          <%
          	}
          %>
        
      </table>

      <p class="more" id="more">

        <%
        	if (request.getAttribute("toggleGenre") != null) {
        %>
        <object id="videocore" name="videocore" width="425" height="344">
          <param id="pMovie" name="movie" value="http://www.youtube.com/v/<%=cliplink%>&fs=1&"></param>
          <param name="allowFullScreen" value="true"></param>
          <param name="allowscriptaccess" value="always"></param>
          <embed src="http://www.youtube.com/v/<%=cliplink%>&fs=1&" type="application/x-shockwave-flash" allowscriptaccess="always"
            allowfullscreen="true" width="425" height="344"> </embed>
        </object>

        <%
        	} else {
        %>
        Please select Your favorite music genre.

        <%
        	}
        %>
      </p>

      <table>
        <%
        	size = clips.size() > 14 ? 14 : clips.size();
        	for (int i = 8; i < size; i++) {
        		clip = (YTEntry) clips.get(i);
        		if (clip == null)
        			continue;

        		if (i % 2 == 0) {
        			if (i > 0) {
        %>
        </tr>
        <%
        	}
        			flipper = true;
        %>
        <tr>
          <%
          	}
          %>
          <td>
            <div id="thumb">
              <h4><%=clip.getTitle()%></h4>

              <a href="#" onclick="setVideo('<%=clip.getId()%>');return false;"> <img src="<%=clip.getThumb()%>" />
              </a>
            </div>
          </td>
          <%
          	}
          %>
      </table>
    </div>
    <!--right side end -->

    <div id="ads">
      <table>
        <%
        	size = clips.size() > 26 ? 26 : clips.size();

        	for (int i = 14; i < size; i++) {
        		clip = (YTEntry) clips.get(i);
        		if (clip == null)
        			continue;

        		if (i % 2 == 0) {
        			if (i > 0) {
        %>
        </tr>
        <%
        	}
        			flipper = true;
        %>
        <tr>
          <%
          	}
          %>
          <td>
            <div id="thumb">
              <h4><%=clip.getTitle() %></h4>
              <p>
                <a href="#" onclick="setVideo('<%=clip.getId()%>');return false;"> <img src="<%=clip.getThumb()%>" />
                </a>
              </p>
            </div>
          </td>
          <% 
		}
	 %>
      </table>
      <h4 style="color: white">Wanna more videos? Just refresh this page :)</h4>

    </div>
    <br class="blank" />
  </div>

  <!--body part end -->
  <!--footer start -->

  <div id="footerMain">
    <div id="footer">

      <p id="copy">
        &copy;2008 <a href="mailto:2madman@mail.ru">mdmn</a>
      </p>
      <ul>
        <li>Watch the best <%=gName%> music videos </li>
      </ul>
      <a href="http://www.youtube.com"> <img src="/images/logo-youtube.gif" />
      </a>
    </div>
  </div>
  <!--footer 
end -->
</body>
</html>
