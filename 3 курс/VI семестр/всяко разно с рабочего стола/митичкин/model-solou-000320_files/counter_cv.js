function spylog_process(spylog){var d=document;var n=navigator;var w=window;var s=screen;window.spylog_js=1;var js_version='<script language="javascript">window.spylog_js=1;<\/script>';js_version+='<script language="javascript1.1">window.spylog_js=1.1;<\/script>';js_version+='<script language="javascript1.2">window.spylog_js=1.2;<\/script>';js_version+='<script language="javascript1.3">window.spylog_js=1.3;<\/script>';js_version+='<script language="javascript1.4">window.spylog_js=1.4;<\/script>';js_version+='<script language="javascript1.5">window.spylog_js=1.5;<\/script>';js_version+='<script language="javascript1.6">window.spylog_js=1.6;<\/script>';js_version+='<script language="javascript1.7">window.spylog_js=1.7;<\/script>';js_version+='<script language="javascript1.8">window.spylog_js=1.8;<\/script>';js_version+='<script language="javascript1.9">window.spylog_js=1.9;<\/script>';js_version+='<script language="javascript"><\/script>';document.write(js_version);spylog._js=window.spylog_js;spylog._cookie=1;if(!d.cookie){d.cookie="spylog_test=1; path=/";if(!d.cookie){spylog._cookie=0}}spylog._navigator=(n.appName.toLowerCase().substring(0,2)=="mi")?0:1;if(parent!=w){try{spylog._referrer=parent.document.referrer}catch(e){}}if(spylog._referrer){spylog._frame_referer=d.referrer}else{spylog._referrer=d.referrer}spylog._location=w.location.href;spylog._frame=(parent.frames.length>0)?1:0;spylog._flash="";if(n.plugins&&n.plugins["Shockwave Flash"]){spylog._flash=n.plugins["Shockwave Flash"].description.split("Shockwave Flash ")[1]}else{if(w.ActiveXObject){for(var i=10;i>=2;i--){try{var f=eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."+i+"');");if(f){spylog._flash=i+".0";break}}catch(ee){}}if(spylog._flash==""&&!spylog._navigator&&(n.appVersion.indexOf("MSIE 5")>-1||n.appVersion.indexOf("MSIE 6")>-1)&&clientInformation.appMinorVersion.indexOf("SP2")!=-1){spylog._flash=">=7"}}}if(s.colorDepth){spylog._color_depth=s.colorDepth}else{if(s.pixelDepth){spylog._color_depth=s.pixelDepth}}if(s.width&&s.height){spylog._screen=s.width+"x"+s.height}spylog._java_enabled=(n.javaEnabled()?"Y":"N");var c=spylog.counter.toString();var sp_hostname="u"+sp_str_pad(c.substring(0,c.length-2),3,"0")+"."+c.substring(c.length-2);spylog._url=((spylog.ssl||document.location.protocol=="https:")?"https://sec01-hits":"http://"+sp_hostname)+".spylog.com/cnt";spylog._url+="?cid="+spylog.counter;sp_send(spylog);if(spylog.track_links&&spylog.track_links!="none"){spAddEvent(w,"load",function(){spOnLoad(spylog,spylog._url)})}}function sp_send(c,e){var a=(c.pagelevel?"&p="+c.pagelevel:"")+"&c="+c._cookie+"&pg="+escape(sp_substr(c._location,512))+"&fr="+c._frame+"&fl="+escape(c._flash)+"&px="+c._color_depth+"&sl="+c._js+"&wh="+c._screen+"&j="+c._java_enabled+"&t="+(new Date()).getTimezoneOffset()+"&r="+escape(sp_substr(c._referrer))+(c._frame_referer?("&r1="+escape(sp_substr(c._frame_referer))):"")+((typeof(c.part)!="undefined"&&c.part&&c.part!="")?"&partname="+sp_escape(c.part.replace(/^\s+/,"").replace(/\s+$/,"")):"");var b=c._url+a+"&rn="+Math.random();if(e){var d=new Image();d.src=b;d.onload=function(){return}}else{document.write('<a href="'+b+'&f=3" target="_blank"><img src="'+b+'" alt="SpyLOG" border="0"></a>')}}function spOnLoad(b,a){spAddEvent(document.body,"click",function(c){if(!c){var c=window.event}spLinkDetector(c,b,a)})}function spLinkDetector(g,c,b){var d;if(g.target){d=g.target}else{if(g.srcElement){d=g.srcElement}}if(d.nodeType==3){d=d.parentNode}var f=d.tagName.toString().toLowerCase();while(d.parentNode&&d.parentNode.tagName&&((f!="a"&&f!="area")||typeof(d.href)=="undefined"||d.href=="")){d=d.parentNode;f=d.tagName.toString().toLowerCase()}if(!d.href){return}var a=d.getAttribute("sp_eventNeed");if(d.href.match(/^javascript:/)&&!a){return}if(a!=""&&a!=null){c._title="ADVID="+a+";"}if(c.track_links=="ext"&&window.location.hostname==d.hostname){return}c._referrer=document.location.href;c._location=d.href;c.pagelevel=3;sp_send(c,1)}function spAddEvent(c,a,b){if(c.addEventListener){c.addEventListener(a,b,false)}else{if(c.attachEvent){c.attachEvent("on"+a,b)}}}function sp_substr(b,a){if(!b){return b}if(!a){a=250}if(b.length>a){var c=b.indexOf("?");if(c!=-1){b=b.slice(0,c)}}if(b.length>a){b=b.substring(0,a)}return b}function sp_escape(d){var e="";var b=d.length;for(var c=0;c<b;c++){var a=d.charCodeAt(c);if(a<255){e+=d.charAt(c);continue}a=a.toString(16);e+="%u"+sp_str_pad(a.toLowerCase(),4,"0")}return e}function sp_str_pad(f,a,e){var d=f.length;if(d>=a){return f}var c=a-d;for(var b=0;b<c;b++){f=e+f}return f}if("undefined"==typeof(spylog_counter)){var jsnode=document.getElementById("spylog_code");if(jsnode){spylog_process({counter:jsnode.getAttribute("counter"),pagelevel:jsnode.getAttribute("page_level"),part:jsnode.getAttribute("part"),track_links:jsnode.getAttribute("track_links"),ssl:(jsnode.getAttribute("src").substr(0,5)=="https")})}}else{spylog_process({counter:spylog_counter,pagelevel:spylog_page_level,part:spylog_part,track_links:spylog_track_links})}function spylog_tracker(b,a){spylog_process({counter:b,part:a})};