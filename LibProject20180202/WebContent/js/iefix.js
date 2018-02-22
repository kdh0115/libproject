
function ieFix(topLevel) 
{
var ua = navigator.userAgent;
var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
var isMSIE5_5 = isMSIE && (ua.indexOf('MSIE 5.5') != -1);
var isMSIE6 = isMSIE && (ua.indexOf('MSIE 6.0') != -1);

	if (isMSIE5_5 || isMSIE6) 
	{
	document.getElementById(topLevel).innerHTML = document.getElementById(topLevel).innerHTML.replace (/<ul/gi,"<table><tr><td><ul").replace (/<\/ul>/gi,"</ul></td></tr></table></a>");
	for (i=0;i<document.getElementsByTagName("li").length; i++) 
		{
		if (document.getElementsByTagName("li").item(i).className == "sub")
			{
			document.getElementsByTagName("li").item(i).innerHTML = document.getElementsByTagName("li").item(i).innerHTML.replace(/<\/a>/i,"");
			}
		}
	}
}