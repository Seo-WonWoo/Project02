<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/footer.css">
</head>
<body>
	<footer id="footer" class="content">
        <div class="inner">
            <div class="total_box wrap">
                <ul class="logo_img wrap">
                    <li class="f_logo">
                        <img src="./images/footer/logo_main.png" alt="">
                    </li>
                </ul>

                <ul class="gnb wrap_s">
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
                
                <div class="box">
                    <ul class="git_url wrap_s">
                        <li>githubURL : &nbsp;</li>
                        <li class="aqua">
                            <a href="https://github.com/Seo-WonWoo/Project02.git">https://github.com/Seo-WonWoo/Project02.git</a>
                        </li>
                    </ul>
                    <ul class="info mt20">
                        <li>©2024.Berry All Right Reserved.</li>
                    </ul>
                </div>
                
            </div>
        </div>
    </footer>
</body>
</html>