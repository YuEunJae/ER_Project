/* 쿠키 */

function setCookie(cookieName, cookieValue) {
	var date = new Date();
	date.setDate(date.getDate() + 1);

    var willCookie = "";
    willCookie += cookieName + "=" + cookieValue + ";";
    willCookie += "expires=" + date;

    document.cookie = willCookie;
}

function getCookie(cookieName){

    var cookies = document.cookie.split(";");

    for(var i in cookies){
        if(cookies[i].indexOf(cookieName) != -1){
            return cookies[i].replace(" ", "").replace(cookieName + "=", "");
        }
    }
}