!function(e,t){function n(e,t){var n=e.createElement("p"),r=e.getElementsByTagName("head")[0]||e.documentElement;return n.innerHTML="x<style>"+t+"</style>",r.insertBefore(n.lastChild,r.firstChild)}function r(){var e=x.elements;return"string"==typeof e?e.split(" "):e}function a(e,t){var n=x.elements;"string"!=typeof n&&(n=n.join(" ")),"string"!=typeof e&&(e=e.join(" ")),x.elements=n+" "+e,s(t)}function o(e){var t=T[e[S]];return t||(t={},N++,e[S]=N,T[N]=t),t}function i(e,n,r){if(n||(n=t),v)return n.createElement(e);r||(r=o(n));var a;return a=r.cache[e]?r.cache[e].cloneNode():b.test(e)?(r.cache[e]=r.createElem(e)).cloneNode():r.createElem(e),!a.canHaveChildren||E.test(e)||a.tagUrn?a:r.frag.appendChild(a)}function c(e,n){if(e||(e=t),v)return e.createDocumentFragment();n=n||o(e);for(var a=n.frag.cloneNode(),i=0,c=r(),l=c.length;l>i;i++)a.createElement(c[i]);return a}function l(e,t){t.cache||(t.cache={},t.createElem=e.createElement,t.createFrag=e.createDocumentFragment,t.frag=t.createFrag()),e.createElement=function(n){return x.shivMethods?i(n,e,t):t.createElem(n)},e.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+r().join().replace(/[\w\-:]+/g,function(e){return t.createElem(e),t.frag.createElement(e),'c("'+e+'")'})+");return n}")(x,t.frag)}function s(e){e||(e=t);var r=o(e);return!x.shivCSS||p||r.hasCSS||(r.hasCSS=!!n(e,"article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}")),v||l(e,r),e}function u(e){for(var t,n=e.getElementsByTagName("*"),a=n.length,o=RegExp("^(?:"+r().join("|")+")$","i"),i=[];a--;)t=n[a],o.test(t.nodeName)&&i.push(t.applyElement(d(t)));return i}function d(e){for(var t,n=e.attributes,r=n.length,a=e.ownerDocument.createElement(j+":"+e.nodeName);r--;)t=n[r],t.specified&&a.setAttribute(t.nodeName,t.nodeValue);return a.style.cssText=e.style.cssText,a}function m(e){for(var t,n=e.split("{"),a=n.length,o=RegExp("(^|[\\s,>+~])("+r().join("|")+")(?=[[\\s,>+~#.:]|$)","gi"),i="$1"+j+"\\:$2";a--;)t=n[a]=n[a].split("}"),t[t.length-1]=t[t.length-1].replace(o,i),n[a]=t.join("}");return n.join("{")}function f(e){for(var t=e.length;t--;)e[t].removeNode()}function h(e){function t(){clearTimeout(i._removeSheetTimer),r&&r.removeNode(!0),r=null}var r,a,i=o(e),c=e.namespaces,l=e.parentWindow;return!w||e.printShived?e:("undefined"==typeof c[j]&&c.add(j),l.attachEvent("onbeforeprint",function(){t();for(var o,i,c,l=e.styleSheets,s=[],d=l.length,f=Array(d);d--;)f[d]=l[d];for(;c=f.pop();)if(!c.disabled&&F.test(c.media)){try{o=c.imports,i=o.length}catch(h){i=0}for(d=0;i>d;d++)f.push(o[d]);try{s.push(c.cssText)}catch(h){}}s=m(s.reverse().join("")),a=u(e),r=n(e,s)}),l.attachEvent("onafterprint",function(){f(a),clearTimeout(i._removeSheetTimer),i._removeSheetTimer=setTimeout(t,500)}),e.printShived=!0,e)}var p,v,g="3.7.3-pre",y=e.html5||{},E=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,b=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,S="_html5shiv",N=0,T={};!function(){try{var e=t.createElement("a");e.innerHTML="<xyz></xyz>",p="hidden"in e,v=1==e.childNodes.length||function(){t.createElement("a");var e=t.createDocumentFragment();return"undefined"==typeof e.cloneNode||"undefined"==typeof e.createDocumentFragment||"undefined"==typeof e.createElement}()}catch(n){p=!0,v=!0}}();var x={elements:y.elements||"abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output picture progress section summary template time video",version:g,shivCSS:y.shivCSS!==!1,supportsUnknownElements:v,shivMethods:y.shivMethods!==!1,type:"default",shivDocument:s,createElement:i,createDocumentFragment:c,addElements:a};e.html5=x,s(t);var F=/^$|\b(?:all|print)\b/,j="html5shiv",w=!v&&function(){var n=t.documentElement;return!("undefined"==typeof t.namespaces||"undefined"==typeof t.parentWindow||"undefined"==typeof n.applyElement||"undefined"==typeof n.removeNode||"undefined"==typeof e.attachEvent)}();x.type+=" print",x.shivPrint=h,h(t),"object"==typeof module&&module.exports&&(module.exports=x)}("undefined"!=typeof window?window:this,document);