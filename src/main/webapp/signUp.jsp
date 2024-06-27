<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="referrer" content="always">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0">
    <!-- No cache -->
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache; no-store; no-save">
    <meta property="og:title" content="프로젝트">
    <title>프로젝트</title>

    <link rel="stylesheet" href="./css/sub.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/layout.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/board.css">

</head>
<body>
	<div class="field">
		<form action="signUpAction.jsp" method="post" id="signUp_form">
        <div class="store_search_box center_box">
            <h2 class="title mb30">회원가입</h2>
            <div class="wrap_s">
                <div class="wrap_s box">
                    <p class="text">아이디</p>
                    <input type="text" name="id_signUp">
                </div>
            </div>
            
            <div class="wrap_s box mt20">
                <p class="text">비밀번호</p>
                <input type="password" name="pw_signUp">
            </div>
            
            <div class="wrap_s box mt20">
                <p class="text">이름</p>
                <input type="text" name="name_signUp">
            </div>

            <div class="wrap_s box mt20">
                <p class="text">주민번호</p>
                <input type="text" name="jumin_signUp">
            </div>

            <div class="wrap_s box mt20">
                <p class="text">전화번호</p>
                <input type="tel" name="tel_signUp">
            </div>

            <div class="wrap_s box mt20">
                <p class="text">주소</p>
                <input type="text" name="address_signUp">
            </div>

            <div class="btn2 mt30" style="float: right; padding: 15px 0;" onclick="signUpSubmit()">가입하기</div>
        </div>
        </form>
    </div>
    
    <script>
    	function signUpSubmit(){
			document.getElementById('signUp_form').submit();
		}
    </script>
</body>
</html>