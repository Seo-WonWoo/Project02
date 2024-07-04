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

	<header id="header" class="sub">
		<jsp:include page="header.jsp" />
	</header>

	<section class="container content">
		<div class="inner">
		<h2 class="sub_title mt40">회원관리</h2>
			
			<%
			MemberDAO memberDAO = new MemberDAO();
			List<MemberDTO> memberList = memberDAO.getMemberList(); //등록회원 전체 리스트 호출 및 리스트 변수 저장
			%>


			<table id="find_business_table" class="new_tbl_board tb01 mt40 mb80">
				<colgroup>
					<col style="width: 4%;">
					<col style="width: 8%;">
					<col style="width: 8%;">
					<col style="width: 6%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 20%;">
					<col style="width: 6%;">
					<col style="width: 6%;">
					<col style="width: 6%;">
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
						<th scope="col">직급</th>
						<th scope="col">계정상태</th>
						<th scope="col">계정상태관리</th>
					</tr>
				</thead>
				<tbody>

					<%
					//페이지 기능은 검색페이지 내용과 동일
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
						String manager = "M"; //관리자
						String general = "G"; //일반회원
						String sleepAccountState = "F"; //휴먼상태
						String pendingState = "P"; //휴먼해제신청상태
						String awakeState = "T"; //정상상태
					%>
					<tr>
						<td><%=memberNumber%></td>
						<td><%=member.getMemberId()%></td>
					<%
						//비밀번호 "*" 표기(보안)
						int pwLength = member.getMemberPw().length();
						String memberPw = "";
						for(int j=0; j<pwLength; j++){
							memberPw += "*";
						}
					%>						
						<td><%=memberPw%></td>
						<td><%=member.getMemberName()%></td>
					<%
						//주민번호 뒷자리 "*" 표기(보안)
						String memberJuminNumber = member.getMemberJuminNumber().substring(0, 8);
						memberJuminNumber += "******";
					%>
						
						<td><%=memberJuminNumber %></td>
						<td><%=member.getMemberTel()%></td>
						<td><%=member.getMemberAddress()%></td>
					<%						
						if(member.getMemberPosition().equals(manager)) { //관리자 경우
					%>	
						<td>관리자</td>
					<%
						} else if(member.getMemberPosition().equals(general)) {	//일반회원 경우					
					%>
						<td>일반회원</td>
					<%						
						}
						if(member.getMemberState().equals(awakeState)) { //정상상태 경우
					%>
						<td>정상</td>
						<td><div class="btn2" style="width:130px; padding: 8px 0; background-color:red"
						onclick="location.href='sleepAccountAction.jsp?memberNumber=<%=member.getMemberNumber()%>&memberState=<%=member.getMemberState()%>'">휴먼상태전환</div></td>
					<%
						} else if(member.getMemberState().equals(pendingState)) { //휴먼해제신청상태 경우
					%>
						<td>휴먼해제신청</td>
						<td><div class="btn2" style="width:130px; padding: 8px 0; background-color:blue"
						onclick="location.href='sleepAccountAction.jsp?memberNumber=<%=member.getMemberNumber()%>&memberState=F'">휴먼상태해제</div></td>					
					<%	
						} else { //휴먼상태 경우						
					%>
						<td>휴먼</td>
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



</body>
</html>