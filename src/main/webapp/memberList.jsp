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
<%@ page import="db.dto.MemberDTO"%>
<%@ page import="db.dao.MemberDAO"%>
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
		<%
			request.setCharacterEncoding("UTF-8"); //문자인코딩 설정  한글깨짐 방지
		
			int sCity = (request.getParameter("surch_city") != null && !request.getParameter("surch_city").isEmpty())
					? Integer.parseInt(request.getParameter("surch_city"))
					: 0;
			int sCountry = (request.getParameter("surch_country") != null && !request.getParameter("surch_country").isEmpty())
					? Integer.parseInt(request.getParameter("surch_country"))
					: 0;
			int sDong = (request.getParameter("surch_dong") != null && !request.getParameter("surch_dong").isEmpty())
					? Integer.parseInt(request.getParameter("surch_dong"))
					: 0;
			int sRS = (request.getParameter("surch_restaurant_sector") != null
					&& !request.getParameter("surch_restaurant_sector").isEmpty())
					? Integer.parseInt(request.getParameter("surch_restaurant_sector"))
					: 0;
			int sCert = (request.getParameter("surch_certification") != null
					&& !request.getParameter("surch_certification").isEmpty())
					? Integer.parseInt(request.getParameter("surch_certification"))
					: 0;
		
			int sConv1 = (request.getParameter("surch_convenience_1") != null
					&& !request.getParameter("surch_convenience_1").isEmpty()) ? 1 : 0;
			int sConv2 = (request.getParameter("surch_convenience_2") != null
					&& !request.getParameter("surch_convenience_2").isEmpty()) ? 2 : 0;
			int sConv3 = (request.getParameter("surch_convenience_3") != null
					&& !request.getParameter("surch_convenience_3").isEmpty()) ? 3 : 0;
			int sConv4 = (request.getParameter("surch_convenience_4") != null
					&& !request.getParameter("surch_convenience_4").isEmpty()) ? 4 : 0;
			int sConv5 = (request.getParameter("surch_convenience_5") != null
					&& !request.getParameter("surch_convenience_5").isEmpty()) ? 5 : 0;
			int sConv6 = (request.getParameter("surch_convenience_6") != null
					&& !request.getParameter("surch_convenience_6").isEmpty()) ? 6 : 0;
			int sConv7 = (request.getParameter("surch_convenience_7") != null
					&& !request.getParameter("surch_convenience_7").isEmpty()) ? 7 : 0;
			int sConv8 = (request.getParameter("surch_convenience_8") != null
					&& !request.getParameter("surch_convenience_8").isEmpty()) ? 8 : 0;
		
			String sRN = request.getParameter("surch_restaurant_name");
			String sKW = request.getParameter("surch_keyword");
			%>

	<header id="header" class="sub">
		<jsp:include page="header.jsp" />
	</header>

	<section class="container content">
		<div class="inner">
		<h2 class="sub_title mt40">회원관리</h2>

			<!-- 업체 리스트 정보 데이터베이스 자바 객체 클래스 생성 -->
			<%
			MemberDAO memberDAO = new MemberDAO();
			List<MemberDTO> memberList = memberDAO.findMemberList();
			%>


			<table id="find_business_table" class="new_tbl_board tb01 mt40 mb80">
				<colgroup>
					<col style="width: 4%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 6%;">
					<col style="width: 10%;">
					<col style="width: 8%;">
					<col style="width: 20%;">
					<col style="width: 3%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="hd">번호</th>
						<th scope="col" class="hd">아이디</th>
						<th scope="col" class="hd">비밀번호</th>
						<th scope="col" class="hd">이름</th>
						<th scope="col" class="hd">주민번호</th>
						<th scope="col" class="hd">전화번호</th>
						<th scope="col">주소</th>
						<th scope="col">탈퇴여부</th>
					</tr>
				</thead>
				<tbody>

					<%
					int itemsPerPage = 10;
					int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
					int totalItems = memberList.size();
					int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

					int start = (currentPage - 1) * itemsPerPage;
					int end = Math.min(start + itemsPerPage, totalItems);
					%>
					<%
					for (int i = start; i < end; i++) {
						MemberDTO member = memberList.get(i);
						int memberNumber = i + 1;
					%>
					<tr>
						<td><%=memberNumber%></td>
						<td><%=member.getMemberId()%></td>
						<td><%=member.getMemberPw()%></td>
						<td><%=member.getMemberName()%></td>
						<td><%=member.getMemberJumin()%></td>
						<td><%=member.getMemberTel()%></td>
						<td><%=member.getMemberAddress()%></td>
						<td><%=member.getMemberState()%></td>
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


	<script>	
	
		function countryListByCitySelect(){			
			let str = '<option value="" selected>전체</option>';
			countryList.forEach( (item, index) =>{
				if(document.querySelector('#city_select').value == item.cityId)
				str += `<option value="` + item.countryId + `">` + item.countryName + `</option>`;				
			});
			document.querySelector('#country_select').innerHTML = str;
			
		}
	    
		
		function dongListByCountrySelect(){			
			let str = '<option value="" selected>전체</option>';
			dongList.forEach( (item, index) =>{
				if(document.querySelector('#country_select').value == item.countryId)
				str += `<option value="` + item.dongId + `">` + item.dongName + `</option>`;				
			});
			document.querySelector('#dong_select').innerHTML = str;
		}
		
		function surchSubmit(){
			document.getElementById('surch_form').submit();
		}
		
		
		function allCheckSelect(){
			console.log(document.querySelector('#AllcheckYn').checked);
			
			convenienceList.forEach( (item, index) =>{
				if(document.querySelector('#AllcheckYn').checked == true)
					document.querySelector('#check_'+item.convenienceId).checked = true;
				if(document.querySelector('#AllcheckYn').checked == false)
					document.querySelector('#check_'+item.convenienceId).checked = false;				
			})
		}
	</script>

</body>
</html>