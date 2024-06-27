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
<title>폐업신청 페이지</title>

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

	int sCity = (request.getParameter("search_city") != null && !request.getParameter("search_city").isEmpty())
			? Integer.parseInt(request.getParameter("search_city"))
			: 0;
	int sCountry = (request.getParameter("search_country") != null && !request.getParameter("search_country").isEmpty())
			? Integer.parseInt(request.getParameter("search_country"))
			: 0;
	int sDong = (request.getParameter("search_dong") != null && !request.getParameter("search_dong").isEmpty())
			? Integer.parseInt(request.getParameter("search_dong"))
			: 0;
	int sRS = (request.getParameter("search_restaurant_sector") != null
			&& !request.getParameter("search_restaurant_sector").isEmpty())
			? Integer.parseInt(request.getParameter("search_restaurant_sector"))
			: 0;
	int sCert = (request.getParameter("search_certification") != null
			&& !request.getParameter("search_certification").isEmpty())
			? Integer.parseInt(request.getParameter("search_certification"))
			: 0;

	int sConv1 = (request.getParameter("search_convenience_1") != null
			&& !request.getParameter("search_convenience_1").isEmpty()) ? 1 : 0;
	int sConv2 = (request.getParameter("search_convenience_2") != null
			&& !request.getParameter("search_convenience_2").isEmpty()) ? 2 : 0;
	int sConv3 = (request.getParameter("search_convenience_3") != null
			&& !request.getParameter("search_convenience_3").isEmpty()) ? 3 : 0;
	int sConv4 = (request.getParameter("search_convenience_4") != null
			&& !request.getParameter("search_convenience_4").isEmpty()) ? 4 : 0;
	int sConv5 = (request.getParameter("search_convenience_5") != null
			&& !request.getParameter("search_convenience_5").isEmpty()) ? 5 : 0;
	int sConv6 = (request.getParameter("search_convenience_6") != null
			&& !request.getParameter("search_convenience_6").isEmpty()) ? 6 : 0;
	int sConv7 = (request.getParameter("search_convenience_7") != null
			&& !request.getParameter("search_convenience_7").isEmpty()) ? 7 : 0;
	int sConv8 = (request.getParameter("search_convenience_8") != null
			&& !request.getParameter("search_convenience_8").isEmpty()) ? 8 : 0;

	String sRN = request.getParameter("search_restaurant_name");
	String sKW = request.getParameter("search_keyword");
	%>

	<header id="header" class="sub">
		<div class="inner">
			<div class="wrap">
				<a href="/index.html">
					<div class="logo wrap">
						<img src="./images/header/logo_main.png" alt="착한가격안심가게 로고">
					</div>
					<div class="sub_logo wrap">
						<img src="./images/header/logo_sub.png" alt="착한가격안심가게 로고">
					</div>
				</a>

				<div class="nav">
					<ul class="gnb dap1">
						<li class="lnb"><a href="#">착한가격안심가게업소 찾기</a></li>
						<li class="lnb"><a href="#">폐업가게 업데이트</a></li>
						<li class="lnb"><a href="#">폐업신청</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>

	<!-- 검색 데이터베이스 정보 자바스크립트 배열 객체 내 저장 -->
	<!-- 배열 객체(시, 군, 동, 편의기능) 생성 -->
	<script>
		let cityList = new Array();
		let countryList = new Array();
		let dongList = new Array();
		let convenienceList = new Array();
	</script>

	<!-- 시 정보 데이터베이스 자바 객체 클래스 생성 -->
	<%
	CityDAO cityDAO = new CityDAO();
	List<CityDTO> cityList = cityDAO.getCityList();
	%>

	<!-- 군 정보 데이터베이스 자바 객체 클래스 생성 및 자바스크립트 객체 배열 정보 추가 -->
	<%
	CountryDAO countryDAO = new CountryDAO();
	List<CountryDTO> countryList = countryDAO.getCountryList();
	for (CountryDTO country : countryList) {
	%>
	<script>
					countryList.push( { countryId : <%=country.getCountryId()%>,
										countryName : "<%=country.getCountryName()%>",
										cityId : <%=country.getCityId()%>
									  } );
			</script>
	<%
	}
	%>
	<!-- 동 정보 데이터베이스 자바 객체 클래스 생성 및 자바스크립트 객체 배열 정보 추가 -->
	<%
	DongDAO dongDAO = new DongDAO();
	List<DongDTO> dongList = dongDAO.getDongList();
	for (DongDTO dong : dongList) {
	%>
	<script>
					dongList.push( { dongId : <%=dong.getDongId()%>,
									 dongName : "<%=dong.getDongName()%>",
									 countryId : <%=dong.getCountryId()%>,
									 cityId : <%=dong.getCityId()%>
									} );
			</script>
	<%
	}
	%>

	<!-- 업종 정보 데이터베이스 자바 객체 클래스 생성 -->
	<%
	RestaurantSectorDAO restaurantSectorDAO = new RestaurantSectorDAO();
	List<RestaurantSectorDTO> restaurantSectorList = restaurantSectorDAO.getRestaurantSectorList();
	%>


	<!-- 인증 정보 데이터베이스 자바 객체 클래스 생성 -->
	<%
	CertificationDAO certificationDAO = new CertificationDAO();
	List<CertificationDTO> certificationList = certificationDAO.getCertificationList();
	%>



	<section class="container content">
		<div class="inner">

			<h2 class="sub_title mt40">착한가격안심가게업소 찾기</h2>

			<h3 class="select_title mt50">지역별검색</h3>

			<form action="closeSubmitPage.jsp" method="post" id="search_form">
				<div class="store_search_box mt20">
					<div class="item">
						<div class="col3">
							<div class="field">
								<div class="th">시</div>
								<div class="td">
									<label style="display: none">시도</label> <select
										name="search_city" id="city_select" size="1"
										onclick="countryListByCitySelect()">
										<option value="" selected>전체</option>
										<%
										for (CityDTO city : cityList) {
										%>
										<option value=<%=city.getCityId()%>><%=city.getCityName()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
						</div>
						<div class="col3">
							<div class="field">
								<div class="th">구</div>
								<div class="td">
									<label style="display: none">구</label> <select
										name="search_country" id="country_select" size="1"
										onclick="dongListByCountrySelect()">
										<option value="" selected>전체</option>
									</select>

								</div>
							</div>
						</div>
						<div class="col3">
							<div class="field">
								<div class="th">동/면</div>
								<div class="td">
									<label style="display: none">동/면</label> <select
										name="search_dong" id="dong_select" size="1">
										<option value="" selected>전체</option>
									</select>

								</div>
							</div>
						</div>
						<div class="col3 mt20">
							<div class="field">
								<div class="th">업종</div>
								<div class="td">
									<label style="display: none">업종</label> <select
										name="search_restaurant_sector" size="1">
										<option value="" selected>전체</option>
										<%
										for (RestaurantSectorDTO restaurantSector : restaurantSectorList) {
										%>
										<option value=<%=restaurantSector.getRestaurantSectorId()%>><%=restaurantSector.getRestaurantSectorName()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
						</div>

						<div class="col3  mt20">
							<div class="field">
								<div class="th">인증</div>
								<div class="td">
									<label style="display: none">인증</label> <select
										name="search_certification" size="1">
										<option value="" selected>전체</option>
										<%
										for (CertificationDTO certification : certificationList) {
										%>
										<option value=<%=certification.getCertificationId()%>><%=certification.getCertificationName()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="field">
							<div class="th">편의시설</div>
							<div class="td">
								<div class="icheck_wrap">

									<div class="icheck mar">
										<input type="checkbox" name="AllcheckYn" id="AllcheckYn"
											onclick="allCheckSelect()"> <label for="AllcheckYn">전체</label>
									</div>
									<%
									ConvenienceDAO convenienceDAO = new ConvenienceDAO();
									List<ConvenienceDTO> convenienceList = convenienceDAO.getConvenienceList();
									%>
									<%
									for (ConvenienceDTO convenience : convenienceList) {
									%>
									<div class="icheck mar">
										<input type="checkbox"
											name='search_convenience_<%=convenience.getConvenienceId()%>'
											value="1" id="check_<%=convenience.getConvenienceId()%>">
										<label for="check_<%=convenience.getConvenienceId()%>"><%=convenience.getConvenienceName()%></label>
									</div>

									<script>
									convenienceList.push( { convenienceId : <%=convenience.getConvenienceId()%>,
															convenienceName : "<%=convenience.getConvenienceName()%>"
														} );
									console.log('aaa');
								</script>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="col3">
							<div class="field">
								<div class="th">업소명</div>
								<label for="bsshNm" style="display: none">업소명</label>
								<div class="td">
									<input type="text" name="search_restaurant_name" id="bsshNm"
										value="">
								</div>
							</div>
						</div>
						<div class="col3">
							<div class="field">
								<div class="th">대표메뉴</div>
								<label for="keyword" style="display: none">대표메뉴</label>
								<div class="td">
									<input type="text" name="search_keyword" id="keyword" value="">
								</div>
							</div>
						</div>

					</div>
					<div class="btn2" onclick="searchSubmit()" style="float: right;">검색</div>
				</div>
			</form>


			<!-- 업체 리스트 업************************************************************ -->



			<!-- 업체 리스트 정보 데이터베이스 자바 객체 클래스 생성 -->
			<%
			RestaurantDAO restaurantDAO = new RestaurantDAO();
			List<RestaurantDTO> restaurantList = restaurantDAO.findRestaurantList(sCity, sCountry, sDong, sRS, sCert, sConv1,
					sConv2, sConv3, sConv4, sConv5, sConv6, sConv7, sConv8, sRN, sKW);
			%>


			<table id="find_business_table" class="new_tbl_board tb01 mt100 mb80">
				<colgroup>
					<col style="width: 4%;">
					<col style="width: 15%;">
					<col style="width: 10%;">
					<col style="width: 25%;">
					<col style="width: 1%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="hd">번호</th>
						<th scope="col" class="hd">업소명</th>
						<th scope="col" class="hd">업소 전화번호</th>
						<th scope="col">주소</th>
						<th scope="col"></th>
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
					<tr
						onclick="location.href='detailPage.jsp?restaurantId=<%=restaurant.getRestaurantId()%>'">
						<td><%=restaurantNumber%></td>
						<td><%=restaurant.getRestaurantName()%></td>
						<td><%=restaurant.getRestaurantTel()%></td>
						<td><%=restaurant.getRestaurantAddress()%></td>
						<td><div class="btn2" onclick="" style="width:130px; padding: 8px 0;">폐업신청</div></td>
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
		
		function searchSubmit(){
			document.getElementById('search_form').submit();
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