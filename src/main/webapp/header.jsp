<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
	<div class="top_nav">
		<div class="inner">
			<ul class="gnb">
	<%
		if(session.getAttribute("loginId") == null){
	%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="signUp.jsp">회원가입</a></li>
	<%		
		} else{			
			String loginId = session.getAttribute("loginId").toString();
			
	%>
				<li style="color: white;"><%=loginId%>님 환영합니다~!</li>
				<li><a href="logoutAction.jsp">로그아웃</a></li>
	<%
		}
	%>		
			</ul>
		</div>
	</div>
	<div class="main_nav">
		<div class="inner">
			<div class="wrap">
				<a href="mainPage.jsp">
					<div class="logo wrap">
						<img src="./images/header/logo_main.png" alt="착한가격안심가게 로고">
					</div>
					<div class="sub_logo wrap">
						<img src="./images/header/logo_sub.png" alt="착한가격안심가게 로고">
					</div>
				</a>
				<div class="nav">
					<ul class="gnb dap1">
						<li class="lnb"><a href="whatCheepPricePage.jsp">착한가격업소 소개</a></li>
						<li class="lnb"><a href="whatMobumPage.jsp">모범음식점 소개</a></li>
						<li class="lnb"><a href="searchPage.jsp">착한가격/모범업소 찾기</a></li>
	<%
		String managerPosition = "M";
		String loginPosition = session.getAttribute("loginPosition") != null ?
				session.getAttribute("loginPosition").toString() : "";
		if(loginPosition.equals(managerPosition)){
	%>
						<li class="lnb"><a href="restaurantManagePage.jsp">업체관리</a></li>
						<li class="lnb"><a href="memberManagePage.jsp">회원관리</a></li>
	<%		
		}
	%>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>