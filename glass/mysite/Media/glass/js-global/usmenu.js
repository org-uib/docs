// unobtrusive collapsible menu (alt)
// copyright Stephen Chapman http://javascript.about.com
// 17th May 2008
//
// you may use this script on your site provided that
// the copyright notice is retained unaltered.



function toggleMenu(objID) {if (!document.getElementById) return; var i = 1; while(document.getElementById('menu'+i)) {var ob = document.getElementById('menu'+i).nextSibling; ob = ob.style ? ob.style : ob.nextSibling.style; if (objID == 'menu'+i) ob.display = (ob.display == 'block')?'none': 'block'; else ob.display = 'none'; i++;}} var i = 1; while(document.getElementById('menu'+i)) {document.getElementById('menu'+i).onclick= new Function("toggleMenu('menu"+i+"')"); i++;}