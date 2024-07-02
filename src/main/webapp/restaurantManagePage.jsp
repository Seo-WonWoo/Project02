<%@ page import="db.dto.CityDTO"%>
<%@ page import="db.dao.CityDAO"%>
<%@ page import="db.dto.CountryDTO"%>
<%@ page import="db.dao.CountryDAO"%>
<%@ page import="db.dto.DongDTO"%>
<%@ page import="db.dao.DongDAO"%>
<%@ page import="db.dto.RestaurantSectorDTO"%>
<%@ page import="db.dao.RestaurantSectorDAO"%>
<%@ page import="db.dto.CertificationDTO"%>
<%@ page import="db.dao.CertificationDAO"%>
<%@ page import="db.dto.ConvenienceDTO"%>
<%@ page import="db.dao.ConvenienceDAO"%>
<%@ page import="db.dto.RestaurantDTO"%>
<%@ page import="db.dao.RestaurantDAO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="referrer" content="always">
<meta name="mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no,address=no,email=no">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0">
<!-- No cache -->
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache; no-store; no-save">
<meta property="og:title" content="프로젝트">
<title>회원관리 페이지</title>

<link rel="stylesheet" href="./css/sub.css">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/layout.css">
<link rel="stylesheet" href="./css/base.css">
<link rel="stylesheet" href="./css/board.css">

<script src="./script/libs/jquery/jquery-1.12.4.min.js"></script>
<script src="./script/libs/swiper/swiper-4.5.3.min.js"></script>
<script type="text/javascript" src="./script/main.js"></script>

</head>
<body>
	<header id="header" class="sub">
		<jsp:include page="header.jsp" />
	</header>

	<section class="container content">
		<div class="inner">
		<h2 class="sub_title mt40">업체관리(폐업)</h2>

			<!-- 업체 리스트 정보 데이터베이스 자바 객체 클래스 생성 -->
			<%
			RestaurantDAO restaurantDAO = new RestaurantDAO();
			List<RestaurantDTO> restaurantList = restaurantDAO.shutDownRestaurantList();
			%>


			<table id="find_business_table" class="new_tbl_board tb01 mt40 mb80">
				<colgroup>
					<col style="width: 6%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 25%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="hd">번호</th>
						<th scope="col" class="hd">업소명</th>
						<th scope="col" class="hd">업소 전화번호</th>
						<th scope="col">주소</th>
						<th scope="col">운영상태</th>
						<th scope="col">폐업관리</th>
					</tr>
				</thead>
				<tbody>

					<%
					int itemsPerPage = 10;
					int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
					int totalItems = restaurantList.size();
					int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

					int start = (currentPage - 1) * itemsPerPage;
					int end = Math.min(start + itemsPerPage, totalItems);
					%>
					<%
					for (int i = start; i < end; i++) {
						RestaurantDTO restaurant = restaurantList.get(i);
						int restaurantNumber = i + 1;
					%>
					<tr>
						<td><%=restaurantNumber%></td>
						<td><%=restaurant.getRestaurantName()%></td>
						<td><%=restaurant.getRestaurantTel()%></td>
						<td><%=restaurant.getRestaurantAddress()%></td>
					<%
						String shutDouwState = "F";
						String pendingState = "P";
						if(restaurant.getRestaurantState().equals(shutDouwState)){
					%>
						<td>폐업완료</td>
					<%
						} else {						
					%>
						<td>폐업신청대기</td>
					<%
						}
						if(restaurant.getRestaurantState().equals(pendingState)){
					%>	
						<td><div class="btn2" style="width:130px; padding: 8px 0;"
						onclick="location.href='shutDownAction.jsp?restaurantId=<%=restaurant.getRestaurantId() %>'">폐업승인</div></td>					
					<%
						} else {						
					%>
						<td></td>
					<%					
						}
					%>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<div class="pagenation wrap center mb80">
				<div id="at_front" class="at_front boder_box">
					<a href="?page=1"><img src="./images/content/sub/at_front.svg"
						alt=""></a>
				</div>
				<div id="left" class="left boder_box">
					<a href="?page=<%=(currentPage > 1) ? currentPage - 1 : 1%>"><img
						src="./images/content/sub/Icon akar-chevron-left-small.svg" alt=""></a>
				</div>

				<div id="page-numbers" class="page-numbers">
					<%
					for (int i = 1; i <= totalPages; i++) {
						String activeClass = (i == currentPage) ? "on" : "";
					%>
					<div class="number <%=activeClass%>" data-page="<%=i%>">
						<a href="?page=<%=i%>"><%=i%></a>
					</div>
					<%
					}
					%>
				</div>

				<div id="right" class="right boder_box">
					<a
						href="?page=<%=(currentPage < totalPages) ? currentPage + 1 : totalPages%>"><img
						src="./images/content/sub/Icon akar-chevron-right-small.svg"
						alt=""></a>
				</div>
				<div id="at_back" class="at_back boder_box">
					<a href="?page=<%=totalPages%>"><img
						src="./images/content/sub/at_back.svg" alt=""></a>
				</div>
			</div>



		</div>
	</section>
	
	<jsp:include page="footer.jsp" />


	<script>
		
		function surchSubmit(){
			document.getElementById('surch_form').submit();
		}
		
	</script>

</body>
</html>