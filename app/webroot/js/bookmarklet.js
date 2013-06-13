function fInitializeReachliBookMarklet() { 
var hosturl = "http://copublish.in/";
function parseURL(url) {
var a = document.createElement('a');
a.href = url;
return {
source: url,
protocol: a.protocol.replace(':',''),
host: a.hostname,
port: a.port,
query: a.search,
params: (function(){
var ret = {},
seg = a.search.replace(/^\?/,'').split('&'),
len = seg.length, i = 0, s;
for (;i<len;i++) {
if (!seg[i]) { continue; }
s = seg[i].split('=');
ret[s[0]] = s[1];
}
return ret;
})(),
file: (a.pathname.match(/\/([^\/?#]+)$/i) || [,''])[1],
hash: a.hash.replace('#',''),
path: a.pathname.replace(/^([^\/])/,'/$1'),
relative: (a.href.match(/tp:\/\/[^\/]+(.+)/) || [,''])[1],
segments: a.pathname.replace(/^\//,'').split('/')
};
}

function base64_encode (data) {
  // http://kevin.vanzonneveld.net
  // +   original by: Tyler Akins (http://rumkin.com)
  // +   improved by: Bayron Guevara
  // +   improved by: Thunder.m
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   bugfixed by: Pellentesque Malesuada
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   improved by: Rafał Kukawski (http://kukawski.pl)
  // *     example 1: base64_encode('Kevin van Zonneveld');
  // *     returns 1: 'S2V2aW4gdmFuIFpvbm5ldmVsZA=='
  // mozilla has this native
  // - but breaks in 2.0.0.12!
  //if (typeof this.window['btoa'] == 'function') {
  //    return btoa(data);
  //}
  var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,
    ac = 0,
    enc = "",
    tmp_arr = [];

  if (!data) {
    return data;
  }

  do { // pack three octets into four hexets
    o1 = data.charCodeAt(i++);
    o2 = data.charCodeAt(i++);
    o3 = data.charCodeAt(i++);

    bits = o1 << 16 | o2 << 8 | o3;

    h1 = bits >> 18 & 0x3f;
    h2 = bits >> 12 & 0x3f;
    h3 = bits >> 6 & 0x3f;
    h4 = bits & 0x3f;

    // use hexets to index into b64, and append result to encoded string
    tmp_arr[ac++] = b64.charAt(h1) + b64.charAt(h2) + b64.charAt(h3) + b64.charAt(h4);
  } while (i < data.length);

  enc = tmp_arr.join('');

  var r = data.length % 3;

  return (r ? enc.slice(0, r - 3) : enc) + '==='.slice(r || 3);

}

function ResetBookmarklet() {
if (document.getElementById('copublishbookmarklet')) document.body.removeChild(document.getElementById('copublishbookmarklet')); 
if (document.getElementById('cancelcopublishbookmarklet')) document.body.removeChild(document.getElementById('cancelcopublishbookmarklet'));
if (document.getElementById('watch-player')) setCss(document.getElementById('watch-player'), {visibility: 'visible'});
}

function setCss(el, css) {
	for(var property in css) el.style[property] = css[property];
}

function getSelText() {
    var txt = '';
    if (window.getSelection) txt = window.getSelection();
    else if (document.getSelection) txt = document.getSelection();
    else if (document.selection) txt = document.selection.createRange().text;
return txt;
}

function fThrowError(message) {
		if (document.getElementById('errorcopublishbookmarklet')) {
			setCss(document.getElementById('errorcopublishbookmarklet'), {display: 'block'});
			var timeout = setTimeout(function(){if (document.getElementById('closecopublishbookmarklet')) document.getElementById('closecopublishbookmarklet').click();}, 4000);
			document.getElementById('errorcopublishbookmarklet').innerHTML = message + '<br /><a href="#" id="closecopublishbookmarklet"><img src=hosturl+"img/close.png" alt="" style="margin-top: 10px;" /></a>';
			document.getElementById('closecopublishbookmarklet').onclick = function(){clearTimeout(timeout);ResetBookmarklet(); return false;}			
		}
}

ResetBookmarklet()
window.scrollTo(0,0);


var maxwidth=Math.max(document.body.scrollWidth,document.body.offsetWidth,document.documentElement.scrollWidth,document.documentElement.offsetWidth, 1000);
var maxheight=Math.max(document.body.scrollHeight,document.body.offsetHeight,document.documentElement.scrollHeight,document.documentElement.offsetHeight);

var o = document.createElement('div'); o.setAttribute('id', 'copublishbookmarklet');
setCss(o, {
	   position: 'absolute',
	   overflow: 'hidden',
	   zIndex: 100000002,
	   opacity: '0.95',
	   backgroundColor: '#ffffff',
	   left: '0px',
	   top: '0px',
	   width: maxwidth + 'px',
	   minHeight: maxheight + 'px'	   
});

document.body.appendChild(o);


var UserSelectedText = new String(getSelText());
if (UserSelectedText != '') { 
	UserSelectedText = UserSelectedText.substr(0,500);	
}

var imgs = [];
var youtube_img = false;
var vimeo_img = false;
var pinterest_img = false;

var url = document.location.href;
var url_parsed = parseURL(url);

if (url_parsed.host.toLowerCase() == 'www.youtube.com') {
	if (url_parsed.params.v) { 
	youtube_img = document.createElement('img');
	youtube_img.src = 'http://img.youtube.com/vi/' + url_parsed.params.v +'/0.jpg';
	}
}

if (url_parsed.host.toLowerCase() == 'vimeo.com' && url_parsed.path.replace('/','').match('^[0-9]+$')) {
	var metatags = document.getElementsByTagName('meta');
	for (var m = 0; m < metatags.length; m++) {
		if (metatags[m].getAttribute('property') == 'og:image') {
			vimeo_img = document.createElement('img');
			vimeo_img.src = metatags[m].getAttribute('content');
			break;
		}
	}
}

if (url_parsed.host.toLowerCase() == 'pinterest.com' && url_parsed.path.replace('/','').match('^pin/[0-9]+/$')) { 
	var metatags = document.getElementsByTagName('meta');
	for (var m = 0; m < metatags.length; m++) {
		if (metatags[m].getAttribute('property') == 'og:image') {
			pinterest_img = document.createElement('img');
			pinterest_img.src = metatags[m].getAttribute('content');
		}
		if (metatags[m].getAttribute('property') == 'og:description') {
			UserSelectedText = metatags[m].getAttribute('content');
		}	
		if (metatags[m].getAttribute('property') == 'pinterestapp:source') { 
			var url_pineed = metatags[m].getAttribute('content');
			var url_pinned_parsed = parseURL(url_pineed);
			if (url_pinned_parsed.host.toLowerCase() != 'www.copublish.in') url = metatags[m].getAttribute('content');
			else url = url_pinned_parsed.path.replace('/','').replace('c/','').replace('/','');
		}		
	}
}


var images = [];

if (youtube_img) {images[0] = {src: youtube_img.src, alt: '', w: 480, h: 360};
				 if (document.getElementById('watch-player')) setCss(document.getElementById('watch-player'), {visibility: 'hidden'});
}
else if (vimeo_img) {images[0] = {src: vimeo_img.src, alt: '', w: 640, h: 272};}
else if (pinterest_img) {images[0] = {src: pinterest_img.src, alt: '', w: pinterest_img.width, h: pinterest_img.height};}
else {

imgs = document.getElementsByTagName('img');
var l = imgs.length;

for(var i = 0; i < l; i++) {
	if (imgs.item(i).width > 80 && imgs.item(i).height > 80) {
		images.push({src: imgs.item(i).src, alt: imgs.item(i).alt, w: imgs.item(i).width, h: imgs.item(i).height});
	}
}

l = images.length;

var a = [];
    for(var i=0; i < l; i++) {
      for(var j=i+1; j < l; j++) {
        if (images[i].src == images[j].src) j = ++i;
      }
      a.push(images[i]);
    }
images = a;	l = images.length;

var temp = 0, temp_img = {};

for(var i=0; i < l; i++) {
	temp = images[i].w * images[i].h;
	for(var j = i + 1; j < l; j++) {
		if (temp < images[j].w * images[j].h) {			
			temp = images[j].w * images[j].h;			
			temp_img = images[i]; images[i] = images[j]; images[j] = temp_img;
		}
	}
}
	
}

var l = images.length;
var top_div=document.createElement('div');
top_div.setAttribute('id', 'topcopublishbookmarklet');

setCss(top_div, {
	   borderBottom: '1px solid #cccccc',
	   width: (maxwidth - 50) +'px',
	   height: '31px',
	   padding: '40px 25px 40px 25px',
	   fontSize: '19px',
	   backgroundColor: '#f9f8f6',
	   left: '0px',
	   top: '0px',
	   position: 'fixed',
	   textAlign: 'center',
	   overflow: 'hidden',
	   color: '#000000',
	   zIndex: 2
});

var top_text=document.createTextNode('Create a Pin'); top_div.appendChild(top_text);
o.appendChild(top_div);

var logo = document.createElement('img');
	logo.src = hosturl+'img/logo.png';
	setCss(logo, {display: 'block', position: 'absolute', margin: '0px', left: '25px', top: '10px',zIndex: 3});
	top_div.appendChild(logo);
		
var blank_div = document.createElement('div');
	setCss(blank_div, {width: maxwidth + 'px', height: '102px'});
	o.appendChild(blank_div);
	
var error_div = document.createElement('div');
	error_div.setAttribute('id', 'errorcopublishbookmarklet');
	setCss(error_div, {width: '500px', height: 'auto', padding: '10px', textAlign: 'center', backgroundColor: '#ffffff', color: '#000000', fontSize: '14px', margin: '30px auto 30px auto', display: 'none'});
	o.appendChild(error_div);
	
if (l == 0) {fThrowError('No vaild images found!'); return;}
if (url_parsed.protocol.toLowerCase() != 'http' && url_parsed.protocol.toLowerCase() != 'https') {fThrowError('Images are available only for HTML websites!'); return;}



var imgdivsize = Math.round((maxwidth / 5) - 2), imgsize = Math.round((imgdivsize / 100) * 83);
var div;

for(var i = 0; i < l; i++) { 
		if (UserSelectedText != '') images[i].alt = UserSelectedText;
		else images[i].alt = '';
	    div = document.createElement('div');
		setCss(div, {
			   width: imgdivsize + 'px',
			   height: imgdivsize + 'px',
			   border: '1px solid #cccccc',
			   cssFloat: 'left',
			   position: 'relative',
			   zIndex: 1,
			   overflow: 'hidden',
			   textAlign: 'center',
			   fontSize: '10px',
			   color: '#4a4a4a'
		});
		o.appendChild(div);
	
		var atag = document.createElement('a');
		setCss(atag, {
			   display: 'block', 
			   width: imgsize + 'px',
			   height: imgsize + 'px',
			   textAlign: 'center',
			   overflow: 'visible',
			   margin: '0px auto 10px auto',
			   backgroundColor: '#f6f6f6'
		});
		atag.setAttribute('href',hosturl+'posts/viaweb/img:' + encodeURIComponent(base64_encode(images[i].src)) + '/url:' + encodeURIComponent(base64_encode(url)) + '/des:' + encodeURIComponent(base64_encode(images[i].alt)));		
		atag.onclick=function() {ResetBookmarklet(); window.open(this.getAttribute('href'),'_blank','status=no,resizable=yes,scrollbars=yes,personalbar=no,directories=no,location=no,toolbar=no,menubar=no,width=765,height=640,left=0,top=0'); return false;}
		div.appendChild(atag);
		
		var img = document.createElement('img');
		img.src = images[i].src;		
		setCss(img, {
			   maxWidth: imgsize + 'px',
			   maxHeight: imgsize + 'px',
			   border: 'none'			   
		});
		atag.appendChild(img);
		
		if (!youtube_img) {
		if (img.offsetHeight < imgsize) setCss(img, {marginTop: Math.round((imgsize - img.offsetHeight) * 0.5) + 'px'});
		else setCss(img, {marginTop: '0px'});
		}
		else setCss(img, {marginTop:'20px'});
		
		var copublish_this = document.createElement('img');
		copublish_this.src = hosturl+'img/copublish_this.png';
		copublish_this.className = 'copublish_this';
		setCss(copublish_this, {
			   position: 'absolute',
			   top: '50%',
			   marginTop: '-44px',
			   left: '50%',
			   marginLeft: '-73px',
			   display: 'none'
		});
		atag.appendChild(copublish_this);
		
		div.onmouseover = function(){setCss(this.getElementsByClassName('copublish_this')[0], {display: 'block'});}
		div.onmouseout = function(){setCss(this.getElementsByClassName('copublish_this')[0], {display: 'none'});}
		div.appendChild(document.createTextNode(images[i].w + ' x ' + images[i].h));
	
}

	var cancel_div = document.createElement('div');
	cancel_div.setAttribute('id', 'cancelcopublishbookmarklet');
	setCss(cancel_div, {
		   borderTop: '1px solid #cccccc',
		   width: maxwidth + 'px',
		   padding: '10px 0px',
		   textAlign: 'center',
		   fontSize: '14px',
		   fontWeight: 'bold',
		   backgroundColor: '#f9f8f6',
		   cursor: 'pointer',
		   position: 'fixed',
		   left: '0px',
		   bottom: '0px',
		   zIndex: 100000003
	});
	document.body.appendChild(cancel_div);
	cancel_div.appendChild(document.createTextNode('Cancel Pin'));
	cancel_div.onclick = function() {ResetBookmarklet();}
	cancel_div.onmouseover = function(){setCss(this, {color: '#ffffff', backgroundColor: 'blue'});}
	cancel_div.onmouseout = function(){setCss(this, {color: '#000000', backgroundColor: '#f9f8f6'});}
}
fInitializeReachliBookMarklet();
