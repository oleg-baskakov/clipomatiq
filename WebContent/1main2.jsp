<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@page import="java.util.*, com.clipomatiq.youtube.*, com.clipomatiq.Genre, com.clipomatiq.db.DBProcessor;"%>
	<meta name="description" content="Music video channels. New music webtv. ">
	<meta name="keywords" content="video, music video, music tv, genre, video clips, clipomatiq">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Clipomatiq</title>
<link href="style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<!--header paer start -->
<div id="headerPan">

<ul>

<!-- <li><a href="#">home</a></li>
<li><a name="state" href="#">contact</a></li> -->
<li style="color: white">Total videos <%=DBProcessor.getTotalClips()%></li>
</ul>
<h1></h1>
<SCRIPT language="JavaScript">

function  toggleGenre(id){
	loadXMLDoc('/clip?commandId=toggleGenre&id='+id);
}

function stat(n)
{
  switch (n) {
    case 0:
      return "not init";
    break;
      
    case 1: 
      return "loading...";
    break;
    
    case 2: 
      return "loaded";
    break;
    
    case 3: 
      return "in process...";
    break;
      
    case 4: 
      return "ready";
    break;
    
    default:
      return "unknown";  
  }  
}
var oldGenre='2';


function clearStatus() {
var nodeGenre = document.getElementById ('statusText');
nodeGenre.innerText='';
}   

function processReqChange() {   
    
    //alert(stat(req.readyState));
    ab = window.setTimeout("req.abort();", 5000);
    
    if (req.readyState == 4) {
        clearTimeout(ab);
        
         
        // only if "OK"
        if (req.status == 200) {
       		var dv_Result = document.getElementById ('gId'+req.responseText);
        	var nodeGenre = document.getElementById ('gId'+oldGenre);
       		var nodeStatus = document.getElementById ('statusText');
			nodeStatus.innerText='Next videos will be '+dv_Result.innerText+' ';
		   var ac = window.setTimeout("clearStatus();", 8000);
       // var result = req.responseXML.getElementsByTagName('genreId')[0];
        //dv_Result.innerText=req.responseText;
        //alert(req.responseText);
       // alert(req.responseText);
        nodeGenre.style.color ='white';
        dv_Result.style.color ='red';
        oldGenre=req.responseText;
            
        } else {
            alert("error:\n" + req.statusText);
        }
    }  
}

function loadXMLDoc(url) {
    if (window.XMLHttpRequest) {
    	
        req = new XMLHttpRequest();
        req.onreadystatechange = processReqChange;
        req.open("GET", url, true);
        req.send(null);
        
    } else if (window.ActiveXObject) {
    	
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = processReqChange;
            
            req.open("GET", url, true);
            req.send();
        }
    }
}


</SCRIPT>

<!-- 
<form name="search_box" method="post"  action="">
<label>search</label>
<input type="text" name="textbox" value="Your Email" />
<input type="button" name="buttone" class="button" value="" title="button" />
</form> -->
</div>
<h4 style="color: white">Music videos machine</h4>
<!--header part end -->
<!--body part start -->
<div id="mainBody">

<!--left side start -->
<div id="leftPan"> 
<!--<h2>services</h2>-->
<h4 class="lor" id="statusText"></h4>

<p id="pGenries">
<% ArrayList genries = DBProcessor.getGenries();
	Genre genre;
	int fontSize=1;
	int FONT_MAX_SIZE=30;
	int maxminRate[]=DBProcessor.getMinMaxRate4Genre();
	for(int i=0;i<genries.size();i++){
			genre=(Genre)genries.get(i);
			%>
<a  style="font-size: <%=(genre.reqCount-maxminRate[1])*FONT_MAX_SIZE/(maxminRate[0]-maxminRate[1])+8 %>px" id='gId<%=genre.id %>' class="more" href="" onclick="toggleGenre(<%=genre.id %>);return false;"><%=genre.name %></a>
	<%		
	}
 %>
 
</p>
<!-- 
<h3></h3>

<ul class="says">
<li><a href="#">consectetuer </a></li>
<li><a href="#">adipiscing</a></li>
<li><a href="#">Aenean non arcu. </a></li>
<li><a href="#">Cras lacinia id </a></li>
<li><a href="#">vestibulum </a></li>
</ul> 
<a class="more" href="#">more comments</a>-->

</div>
<!--left side end -->
<!--right side start -->
<div id="rightPan">
<p class="more">
<!-- 
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="test" width="490" height="420"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="test.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#869ca7" />
			<param name="allowScriptAccess" value="sameDomain" />
			<embed src="test.swf" quality="high" bgcolor="#869ca7"
				width="490" height="420" name="test" align="middle"
				play="true"
				loop="false"
				quality="high"
				allowScriptAccess="sameDomain"
				type="application/x-shockwave-flash"
				pluginspage="http://www.adobe.com/go/getflashplayer">
			</embed>
	</object>
 -->
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="test" width="480" height="419"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="test.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#869ca7" />
			<param name="allowScriptAccess" value="sameDomain" />
			<embed src="test.swf" quality="high" bgcolor="#869ca7"
				width="480" height="419" name="test" align="middle"
				play="true"
				loop="false"
				quality="high"
				allowScriptAccess="sameDomain"
				type="application/x-shockwave-flash"
				pluginspage="http://www.adobe.com/go/getflashplayer">
			</embed>
	</object>
  

</div>
<!--right side end -->
<br class="blank" />
</div>
<!--body part end -->
<!--footer start -->

<div id="footerMain">
<div id="footer">

<!--<ul> 
<li><a href="#">home</a>|</li>
<li><a href="#">about&nbsp;us</a>|</li>
<li><a href="#">contact</a></li>
</ul>
 -->

<p id="resultResp"> &copy;2008  <a href="mailto:adm@clipomatiq.hostignition.com">mdmn</a></p>
<ul class="css">
<li><a href="http://validator.w3.org/check?uri=referer" target="_blank" class="html" title="html">xhtml</a></li>
<li><a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank" class="cs" title="css">css</a></li>
</ul>
<!-- (C) 2004 stat24.ru -->
<object type="application/x-shockwave-flash" data="http://www.stat24.ru/logo/statLogo.swf?anim=false&amp;color_logo=0xdcdcf0&amp;color_bg=0x000000&amp;color_frame=0x767676&amp;logo_width=90&amp;logo_height=28&amp;klik=stat.pl" width="90" height="28" id="statLogo"><param name="movie" value="http://www.stat24.ru/logo/statLogo.swf?anim=false&amp;color_logo=0xdcdcf0&amp;color_bg=0x000000&amp;color_frame=0x767676&amp;logo_width=90&amp;logo_height=28&amp;klik=stat.pl" /></object>
<!-- begin of Top100 logo -->
<a href="http://top100.rambler.ru/top100/"><img src="http://top100-images.rambler.ru/top100/banner-88x31-rambler-black2.gif" alt="Rambler's Top100" width="88" height="31" border="0" /></a>
<!-- end of Top100 logo -->
<a href="http://www.youtube.com"> <img src="images/logo-youtube.gif" />
</a>


</div>
</div>
<!--footer 
end -->

<!--Rating@Mail.ru COUNTER--><script language="JavaScript" type="text/javascript"><!--
d=document;var a='';a+=';r='+escape(d.referrer)
js=10//--></script><script language="JavaScript1.1" type="text/javascript"><!--
a+=';j='+navigator.javaEnabled()
js=11//--></script><script language="JavaScript1.2" type="text/javascript"><!--
s=screen;a+=';s='+s.width+'*'+s.height
a+=';d='+(s.colorDepth?s.colorDepth:s.pixelDepth)
js=12//--></script><script language="JavaScript1.3" type="text/javascript"><!--
js=13//--></script><script language="JavaScript" type="text/javascript"><!--
d.write('<a href="http://top.mail.ru/jump?from=1493128"'+
' target="_top"><img src="http://d8.cc.b6.a1.top.mail.ru/counter'+
'?id=1493128;t=47;js='+js+a+';rand='+Math.random()+
'" alt="�������@Mail.ru"'+' border="0" height="31" width="88"/><\/a>')
if(11<js)d.write('<'+'!-- ')//--></script><noscript><a
target="_top" href="http://top.mail.ru/jump?from=1493128"><img
src="http://d8.cc.b6.a1.top.mail.ru/counter?js=na;id=1493128;t=47"
border="0" height="31" width="88"
alt="�������@Mail.ru"/></a></noscript><script language="JavaScript" type="text/javascript"><!--
if(11<js)d.write('--'+'>')//--></script><!--/COUNTER-->



<!-- begin of Top100 code -->
<script id="top100Counter" type="text/javascript" src="http://counter.rambler.ru/top100.jcn?1483760"></script><noscript><img src="http://counter.rambler.ru/top100.cnt?1483760" alt="" width="1" height="1" border="0"></noscript>
<!-- end of Top100 code -->
<!-- (C) stat24 / Glavnaya stranitsa -->
<script type="text/javascript">
<!--
document.writeln('<'+'scr'+'ipt type="text/javascript" src="http://ru1.hit.stat24.com/_'+(new Date()).getTime()+'/script.js?id=AkUwDW8LZvzPsqUEHenWjrbt.BkkOEwqCpLP18BPjEr.a7/l=11"></'+'scr'+'ipt>');
//-->
</script>


</body>
</html>
