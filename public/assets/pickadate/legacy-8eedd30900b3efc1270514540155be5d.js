/*!
 * Legacy browser support
 */

Array.isArray||(Array.isArray=function(t){return"[object Array]"=={}.toString.call(t)}),[].map||(Array.prototype.map=function(t,r){for(var e=this,n=e.length,i=Array(n),a=0;n>a;a++)a in e&&(i[a]=t.call(r,e[a],a,e));return i}),[].filter||(Array.prototype.filter=function(t){if(null==this)throw new TypeError;var r=Object(this),e=r.length>>>0;if("function"!=typeof t)throw new TypeError;for(var n=[],i=arguments[1],a=0;e>a;a++)if(a in r){var o=r[a];t.call(i,o,a,r)&&n.push(o)}return n}),[].indexOf||(Array.prototype.indexOf=function(t){if(null==this)throw new TypeError;var r=Object(this),e=r.length>>>0;if(0===e)return-1;var n=0;if(arguments.length>1&&(n=Number(arguments[1]),n!=n?n=0:0!==n&&1/0!=n&&n!=-1/0&&(n=(n>0||-1)*Math.floor(Math.abs(n)))),n>=e)return-1;for(var i=n>=0?n:Math.max(e-Math.abs(n),0);e>i;i++)if(i in r&&r[i]===t)return i;return-1});/*!
 * Cross-Browser Split 1.1.1
 * Copyright 2007-2012 Steven Levithan <stevenlevithan.com>
 * Available under the MIT License
 * http://blog.stevenlevithan.com/archives/cross-browser-split
 */
var nativeSplit=String.prototype.split,compliantExecNpcg=void 0===/()??/.exec("")[1];String.prototype.split=function(t,r){var e=this;if("[object RegExp]"!==Object.prototype.toString.call(t))return nativeSplit.call(e,t,r);var n,i,a,o,l=[],p=(t.ignoreCase?"i":"")+(t.multiline?"m":"")+(t.extended?"x":"")+(t.sticky?"y":""),c=0;for(t=RegExp(t.source,p+"g"),e+="",compliantExecNpcg||(n=RegExp("^"+t.source+"$(?!\\s)",p)),r=void 0===r?-1>>>0:r>>>0;(i=t.exec(e))&&(a=i.index+i[0].length,!(a>c&&(l.push(e.slice(c,i.index)),!compliantExecNpcg&&i.length>1&&i[0].replace(n,function(){for(var t=1;arguments.length-2>t;t++)void 0===arguments[t]&&(i[t]=void 0)}),i.length>1&&i.index<e.length&&Array.prototype.push.apply(l,i.slice(1)),o=i[0].length,c=a,l.length>=r)));)t.lastIndex===i.index&&t.lastIndex++;return c===e.length?(o||!t.test(""))&&l.push(""):l.push(e.slice(c)),l.length>r?l.slice(0,r):l};
