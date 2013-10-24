<?xml version="1.0" encoding="utf-8" ?>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@page import="java.util.*, com.clipomatiq.youtube.*, com.clipomatiq.Genre, com.clipomatiq.db.DBProcessor;"%>
	<meta name="description" content="Free music video channels. New music webtv. music">
   
	<html lang="en">
<head>
<!-- machid: -1 -->


	<%YouTubeData utube=(YouTubeData)request.getAttribute("utube"); %>
	
	<title>YouTube - <%=utube.title %>.</title>

	<link rel="stylesheet" href="/base.css" type="text/css">

<style type="text/css">
	#mainContent {
		float: left; 
		width: 550px;
	}
	
	#search-pva {
		padding-top: 10px;
	}
	
	#doubleClick1 {
		padding-top: 40px;
	}
	
	#doubleClick2 {
		padding-top: 10px;
	}
	
	#video_grid {
		margin-top: 10px;
	}
	
	.grayTextAdWords {
		text-align: right; 
		padding:2px 2px 5px 0; 
		background-color: #FFF9DD;
	}
	
	.vlcell {
		width: 24.9%; 
	}
	
	.vlentry {
		padding-left: 3px;
	}
	
	#afs {
		margin-bottom:0.3em;
	}
	
	.afs-url-green {
		color: green;
	}
	
	.grayTextSponsoredVideo {
		margin-top: -1em;
	}
	
	.sideAd {
		margin-bottom: 1em;
	}
	
	.spacerTD {
		width:5px;
	}
	
	.smInfoText {
		font-size: 11px;
	}
</style>



	<link rel="icon" href="http://s.ytimg.com/yt/favicon-vfl1123.ico" type="image/x-icon">
	<link rel="shortcut icon" href="http://s.ytimg.com/yt/favicon-vfl1123.ico" type="image/x-icon">


	<link rel="alternate" type="application/rss+xml" title="YouTube - [RSS]" href="/rssls">

	<link rel="alternate" media="handheld" href="http://m.youtube.com/results?desktop_uri=%2Fresults%3Fsearch_query%3Dsquarepusher%26search_sort%3Dvideo_view_count%26page%3D1&search_query=squarepusher&search_sort=video_view_count&page=1">

	<script type="text/javascript">
			window.google={kHL:"en"};
	</script>



<SCRIPT language="JavaScript">

function  delClips(id){
	loadXMLDoc('/ProkrustClips?commandId=delClips&clipId='+id);
	delIndex=id;
	//alert(delIndex);
}
function  delClip(id){
	loadXMLDoc('/ProkrustClips?commandId=delClip&clipId='+id);
	delIndex=id;
	//alert(delIndex);
}
function  ssClip(id){
	loadXMLDoc('/ProkrustClips?commandId=slideshow&clipId='+id);
	delIndex=id;
	//alert(delIndex);
}
var delIndex;
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
       		var nodeStatus = document.getElementById ('delStatus'+delIndex);
			nodeStatus.innerText=req.responseText;
		  // var ac = window.setTimeout("clearStatus();", 8000);
       // var result = req.responseXML.getElementsByTagName('genreId')[0];
        //dv_Result.innerText=req.responseText;
        //alert(req.responseText);
       // alert(req.responseText);
       // nodeGenre.style.color ='white';
       // dv_Result.style.color ='red';
       // oldGenre=req.responseText;
            
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



	<script type="text/javascript" src="http://s.ytimg.com/yt/js/base_all_with_bidi-vfl48565.js"></script>

	<script type="text/javascript">

			function _hbLink (a,b) { return false; }
			function urchinTracker (a) { }
			function urchinTrackerDefer(a) { }

		
	var gXSRF_token = '';
	var gXSRF_field_name = '';
	var gXSRF_ql_pair = '';

		gXSRF_token = 'II0x2U5Y-nuyxMruqomAxasbnw98MTIxNzE2NTM0MQ==';
		gXSRF_field_name = 'session_token';
		onLoadFunctionList.push(populate_session_token);

		gXSRF_ql_pair = 'session_token=DhDDd9D_QOtYUV2s7aS4BNtV1bR8MA==';


		var gGoogleSuggest = true;
		var gPixelGif = 'http://s.ytimg.com/yt/img/pixel-vfl73.gif';

		var gIsResultsPage = true;
	</script>



<script type="text/javascript">
	function showDropdown(event, element) {
		removeClass(_gel('search-by-container'), 'show-dropdown');
		removeClass(_gel('sort-by-container'), 'show-dropdown');
		if (element) addClass(element, 'show-dropdown');
		if (!event) event = window.event;
		event.cancelBubble = true;
		if (event.stopPropagation) event.stopPropagation();
	}
	addListener(document, "mouseover", function(e) {
		var element = e.target || e.srcElement;

		if (!hasAncestor(element, 'search-by-container') && _gel('search-by-container')) {
			removeClass(_gel('search-by-container'), 'show-dropdown');
		}
	
		if (!hasAncestor(element, 'sort-by-container') && _gel('sort-by-container')) {
			removeClass(_gel('sort-by-container'), 'show-dropdown'); 
		}
	});

	var gReturnToOriginalEpisodeLink = 'Return to <a class="nowrap" onclick="onOriginalEpisode(this);return false;" href="#">original search result</a>';
	var gResultsSafeSearchOn = false;
	var gResultsURLSafeSearchOff = '/results?search_query=squarepusher&search_sort=video_view_count&safe_search=off';
	var gResultsURLSafeSearchOn = '/results?search_query=squarepusher&search_sort=video_view_count&safe_search=on';
	

</script>


</head>


<body onload="performOnLoadFunctions();" class="en_US is-english">

<div id="baseDiv" class="date-20080726">
	
	<div id="masthead">
		<a href="/" onmousedown="urchinTracker('/Events/Header/YouTubeLogo');" class="logo"><img src="http://s.ytimg.com/yt/img/pixel-vfl73.gif" width="132" height="63" border="0" alt=""/></a>
		<div class="user-info">
			<div id="localePickerBox">
				<div id="flagDiv">
					<div id="flagDivInner">	</div>

					<div class="alignR smallText"><a href="#" onclick="closeLocalePicker(); return false;">Close</a></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div> 
	<div id="search-settings-clr" class="hid"></div>

	
	
	



<div id="search-section-header">


	<div class="name">
			<span  class="search-query"><%=utube.title %></span> video results
	
	

			<strong><%=utube.getStartIndex()%> - <%=utube.getStartIndex()+100 %></strong> of about <strong><%=utube.getTotalResults()%></strong>

	</div>

	<div class="clear"></div>
</div>



	<div id="browse-partner-filter">
		<input id="browse-premium-videos" onclick="window.location.href='/results?search_query=squarepusher&search_sort=video_view_count&partner=1'" type="checkbox" 
><img src="http://s.ytimg.com/yt/img/pixel-vfl73.gif" class="partner-legend" /><label for="browse-premium-videos">Only show <span id="browse-official-videos">partner videos</span></label>

		&nbsp;&nbsp;<span style="display:none" id="translate-checkbox-span"><input id="translate-checkbox" onclick='translateAll("en", "session_token=gy7fFXFdFmIXM4pKnlDhoT5NdsZ8MA==")' 
 type="checkbox"><label id="translate-checkbox-label" for="translate-video-texts"><b>Translate results</b> into my language</label></span>
	</div>

<div id="mainContent">
				
	<div id="video_grid" class="searchView browseGridView"> <!-- start search results -->
	<table width="100%">

	<tr valign="top">
	
	<div class="vlcell" style="width:24.9%">

<td>		


<%
	YTEntry clip;
	for(int i=0;i<utube.getTotalResults();i++){
		clip=(YTEntry)utube.getEntries().get(i);
		%>



		
	<div class="vlentry" >

		<div class="vlcontainer">

			<div class="v120WideEntry">
				<div class="v120WrapperOuter">
					<!--div class="v120WrapperInner"-->
					<table><tr><td>
						<a href="<%=clip.getMediaUrl() %>" ><img src="<%=clip.getThumb()+"1.jpg" %>"  class="vimg120" title="<%=clip.getTitle() %>" alt="video"></a>
					</td>
					<td>
						<img src="<%=clip.getThumb()+"2.jpg" %>"  class="vimg120" title="" alt="video">
					</td>
					<td>
						<img src="<%=clip.getThumb()+"3.jpg" %>"  class="vimg120" title="" alt="video">
					</td>
			</tr>
			</table>
					<!-- /div-->
				</div>
			</div>
	
			<div class="vldescbox" id="vldescbox_55C0RirU3yA">
				<div  class="vltitle">
					<div class="vlshortTitle">
						<span id="translated_short_prefix_55C0RirU3yA" class="small hide">[TRANSLATED]</span>
						<a href="<%=clip.getMediaUrl() %>"  title="<%=clip.getTitle() %>"><%=clip.getTitle() %></a>
					</div>
				</div>
	
				<div  class="vldesc">
							<span  id="BeginvidDesc55C0RirU3yA">
							<%=clip.getContent() %>
							</span>
					<span  id="RemainvidDesc55C0RirU3yA" style="display: none"></span>
					<span id="MorevidDesc55C0RirU3yA" class="smallText">(<a href="#" class="eLink" onclick="showDiv('RemainvidDesc55C0RirU3yA'); hideDiv('MorevidDesc55C0RirU3yA'); hideDiv('BeginvidDesc55C0RirU3yA'); showDiv('LessvidDesc55C0RirU3yA'); return false;">more</a>)</span>
					<span id="LessvidDesc55C0RirU3yA" style="display: none" class="smallText">(<a href="#" class="eLink" onclick="hideDiv('RemainvidDesc55C0RirU3yA'); hideDiv('LessvidDesc55C0RirU3yA'); showDiv('BeginvidDesc55C0RirU3yA'); showDiv('MorevidDesc55C0RirU3yA'); return false;">less</a>)</span>
				</div>
			</div>

			<div class="vlclearaltl"></div>
		</div>

		<div class="vlfacets">
			<div class="vladded">
					<span class="grayText">Added:</span> <%=clip.getDateFrom()%><br/>
			</div>
			<div><span class="grayText vlfromlbl">Delete:</span><span class="vlfrom"><a href="" onclick="delClips('<%=clip.getId() %>');return false;">delete <%=clip.getId() %></a></span></div>
			<div class="clearL" id="delStatus<%=clip.getId() %>"></div>

			<span class="grayText">RC:</span> <%=clip.getRelevanceCount()%><br/>
			<div class="video-thumb-duration-rating">
				<div class="runtime"><%=clip.getArtistName()%></div>
			</div>
			<a href="" onclick="delClip('<%=clip.getUid() %>');return false;">remove from genre <%=clip.getUid() %></a>
			<div class="clear"></div>
			<div class="clearL" id="delStatus<%=clip.getUid() %>"></div>
			
			<a href="" onclick="ssClip('<%=clip.getUid() %>');return false;">setSlideshowClip <%=clip.getUid() %></a>
			<div class="clear"></div>
			

		</div>

		<div class="vlclearaltl"></div>
	</div> <!-- end vEntry -->
		<%} %>


			
	</td>
	</div>
		<div class="vlclear"></div>
	</tr>

	</table>
	</div> <!-- end search results -->

</div>


		<div class="clear"></div>
	<div id="footer">
		<div class="search">
			<div class="promo">
				<a href="/youchoose" onclick="_hbLink('FooterPromo','Footer');"><img id="debates_footer_img" src="http://s.ytimg.com/yt/img/pixel-vfl73.gif" alt="footer-promo" /></a>
				<a href="/ProkrustClips?start=<%=utube.getStartIndex()+30%>" >next <%=utube.getStartIndex()+30%></a>
			</div>
			<form autocomplete="off" name="footer-search-form" method="get" action="/results" style="width: 73.5%;">
					<a href="http://www.google.com/webmasters/igoogle/youtube.html"><img id="igoogle_footer_img" src="http://s.ytimg.com/yt/img/pixel-vfl73.gif" alt=""/> <em id="igoogle_footer_text">Add to iGoogle</em></a>
				<input  type="text" name="search_query" maxlength="128" class="query" onkeyup="goog.i18n.bidi.setDirAttribute(event,this)" value="squarepusher" id="footer-search-term">
				<select class="search-type" name="search_type">
					<option value="">Videos</option>
					<option value="search_users" >Channels</option>
				</select>
				<input type="submit" name="search" value="Search" class="submit-button">
			</form>
		</div>
	</div>
	<div id="copyright">
		&copy; 2008 YouTube, LLC
	</div>


</div> <!-- end baseDiv -->
<a name="pageBottom"></a>
</body>



</html>