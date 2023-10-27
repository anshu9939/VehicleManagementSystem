//
function getDate() {
  var today = new Date();
  var date =
    today.getFullYear() +
    "-" +
    twoDigits(today.getMonth() + 1) +
    "-" +
    twoDigits(today.getDate()) +
    " ";
  var time =
    twoDigits(today.getHours()) +
    ": " +
    twoDigits(today.getMinutes()) +
    ": " +
    twoDigits(today.getSeconds());
  $("#time").html("Current Time : " + date + " " + time);
}
function twoDigits(val) {
  if (val < 10) return "0" + val;
  return val;
}
$(function() {
  setInterval(getDate, 1000);
});
// toggle 
$.fn.toggle2classes = function(class1, class2) {
  if (!class1 || !class2) return this;

  return this.each(function() {
    var $elm = $(this);

    if ($elm.hasClass(class1) || $elm.hasClass(class2))
      $elm.toggleClass(class1 + " " + class2);
    else $elm.addClass(class1);
  });
};

// 
$(".popver-box-close").click(function () {
  $(".popver-box").hide()
})

// cookie 
function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
  var expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + "; " + expires + "; path=/"; 
}
//cookie
function getCookie(cname) {
  var name = cname + "=";
  var ca = document.cookie.split(";");
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == " ") c = c.substring(1);
    if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
  }
  return "";
}
//清除cookie
function clearCookie(name) {
  setCookie(name, "", -1);
}
//  setCookie("remember", "true", {expires: 7}); //存储一个带7天期限的cookie
//  setCookie("username", "userValue", {expires: 7});
//  setCookie("password", "password", {expires: 7});
//  getCookie("remember");//获取对应cookie值
//  getCookie("username");
//  getCookie("password");
//  clearCookie("remember");//删除cookie值
//  clearCookie("username");
//  clearCookie("password");
// clearCookie("role")