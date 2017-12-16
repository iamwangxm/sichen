function m(a, b)
{
  return a.position = b
}
function o(a, b)
{
  return a.left = b
}
function ca(a, b)
{
  return a.zIndex = b
}
var p = "length", r = "style", s = "body", x, y;
function U(a)
{
  return document.createElement(a)
}
var Y, mb, nb, ob, pb, Z, $;
var qb = 0, rb = 0, sb = 115, tb = 30, ub = 134, vb = 30, wb = 114, xb = 30, yb = 131, zb = 30, Ab = 5, Bb = 6, Cb = 1, Db = 200;
var Eb;
var Fb = "/images/logotop.gif";
function Gb(a)
{
  var b = 0, c = 0;
  if (a.pageX || a.pageY)
  {
    b = a.pageX;
    c = a.pageY
  }
  else if (a.clientX || a.clientY)
  {
    b = a.clientX + document[s].scrollLeft;
    c = a.clientY + document[s].scrollTop
  }
  return [b, c]
}
function Ib(a)
{
  Jb();
  a = a || document.parentWindow.event;
  var b = Gb(a), c = b[0], d = b[1];
  Kb(c, d, Z, sb, tb);
  Kb(c, d, $, ub, vb)
}
function Kb(a, b, c, d, g)
{
  var e = a - d - mb, f = (b - g - nb) * (Ab / Bb), j = Math.sqrt(Math.pow(e, 2)
    + Math.pow(f, 2)), h, l;
  if (j == 0)
  {
    h = d;
    l = g
  }
  else
  {
    var B = Math.sqrt(Math.pow(j, 2) + Math.pow(Db, 2)), E = Ab * j / B;
    h = E * e / j + d + mb;
    l = E * f / j / (Ab / Bb) + g + nb
  }
  h -= Cb;
  l -= Cb;
  o(c[r], parseInt(h, 10) + "px");
  c[r].top = parseInt(l, 10) + "px"
}
function EYES_init()
{
  var a = Mb("sidebar"), b = Nb(a, "a");
  Eb = Nb(a, "img");
  if ( - 1 == Eb.src.indexOf(Fb))
  {
    return
  }
  Y = U("img");
  Z = U("img");
  $ = U("img");
  Y.border = (Z.border = ($.border = 0));
  Y.src = "/images/dang1.gif";

  Z.src = ($.src = "/images/eye3.gif");
  Jb();
  m(Y[r], m(Z[r], m($[r], "absolute")));
  ca(Y[r], 90);
  ca(Z[r], ca($[r], 100));
  b.appendChild(Y);
  b.appendChild(Z);
  b.appendChild($);
  document.onmousemove = Ib;
  T(window, "pageshow", Jb);
  T(window, "resize", Jb);
  
}
function Jb()
{
  var a = Ob(Eb);
  mb = a.x;
  nb = a.y;
  ob = Eb.width;
  pb = Eb[p];
  var b = "px";
  o(Y[r], mb + qb+ b);
  Y[r].top = nb + rb + b;
  o(Z[r], a.x + wb + b);
  Z[r].top = a.y + xb + b;
  o($[r], a.x + yb + b);
  $[r].top = a.y + zb + b
}
function Ob(a)
{
  var b = a.offsetLeft, c = a.offsetTop;
  if (a.offsetParent != null)
  {
    var d = Ob(a.offsetParent);
    b += d.x;
    c += d.y;
  }
  return{x:b,y:c}
}
function T(a, b, c)
{
  var d = "on" + b;
  if (a.addEventListener)
  {
    a.addEventListener(b, c, false)
  }
  else if (a.attachEvent)
  {
    a.attachEvent(d, c)
  }
  else
  {
    var g = a[d];
    a[d] = function()
    {
      var e = g.apply(this, arguments), f = c.apply(this, arguments);
      return e == undefined ? f : (f == undefined ? e : f && e)
    }
  }
};
function Mb(a)
{
  return document.getElementById(a)
}
function Nb(a, b)
{
  return a.getElementsByTagName(b)[0]
}
EYES_init();
/*
qb£ºÕÚµ²Í¼Æ¬ºá×ø±ê
rb£ºÕÚµ²Í¼Æ¬×Ý×ø±ê
sb£º×óÑÛÍ¼Æ¬ºá×ø±ê
tb£º×óÑÛÍ¼Æ¬×Ý×ø±ê
ub£ºÓÒÑÛÍ¼Æ¬ºá×ø±ê
vb£ºÓÒÑÛÍ¼Æ¬×Ý×ø±ê
-----
wb£º×óÑÛÍ¼Æ¬³õÊ¼ºá×ø±ê
xb£º×óÑÛÍ¼Æ¬³õÊ¼×Ý×ø±ê
yb£ºÓÒÑÛÍ¼Æ¬³õÊ¼ºá×ø±ê
zb£ºÓÒÑÛÍ¼Æ¬³õÊ¼×Ý×ø±ê
-----
Ab£ºÑÛ¾¦ÔË¶¯·¶Î§£¨ÍÖÔ²ÐÎ£©ºáÖá³¤¶È
Bb£ºÑÛ¾¦ÔË¶¯·¶Î§£¨ÍÖÔ²ÐÎ£©×ÝÖá³¤¶È
-----
Cb£º×÷ÓÃ²»Ïê£¬±£³ÖÄ¬ÈÏ¼´¿É
Db£ºÑÛ¾¦Êó±êÔË¶¯µÄÁéÃô³Ì¶È
-----
Fb£ºlogoÍ¼Æ¬µØÖ·
Y.src£ºÕÚµ²ÑÛ¾¦µÄÍ¼Æ¬µØÖ·
Z.src£ºÑÛ¾¦µÄÍ¼Æ¬µØÖ·
*/
