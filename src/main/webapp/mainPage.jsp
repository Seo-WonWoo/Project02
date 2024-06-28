<%@ page import="db.dto.RestaurantSectorDTO"%>
<%@ page import="db.dao.RestaurantSectorDAO"%>
<%@ page import="db.dto.CertificationDTO"%>
<%@ page import="db.dao.CertificationDAO"%>
<%@ page import="db.dto.RestaurantDTO"%>
<%@ page import="db.dao.RestaurantDAO"%>
<%@ page import="db.dto.ConvenienceDTO"%>
<%@ page import="db.dao.ConvenienceDAO"%>
<%@ page import="db.dto.MenuSectorDTO"%>
<%@ page import="db.dao.MenuSectorDAO"%>
<%@ page import="db.dto.MenuDTO"%>
<%@ page import="db.dao.MenuDAO"%>
<%@ page import="db.dto.AppraisalDTO"%>
<%@ page import="db.dao.AppraisalDAO"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.util.List"%>
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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0">
<!-- No cache -->
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache; no-store; no-save">
<meta property="og:title" content="프로젝트">
<title>프로젝트</title>

<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/layout.css">
<link rel="stylesheet" href="./css/base.css">
<link rel="stylesheet" href="./css/board.css">

<script src="./script/libs/jquery/jquery-1.12.4.min.js"></script>
<script src="./script/libs/swiper/swiper-4.5.3.min.js"></script>
<script type="text/javascript" src="./script/main.js"></script>
</head>
<body>
	<header id="header">
		<jsp:include page="header.jsp" />
	</header>

	<section id="visual">
		<div class="inner">
			<form action="searchPage.jsp" method="get" id="search_form1">
			<div class="visual_search">
				<div class="wrap">
					<input type="text" class="input" name="search_restaurant_name"
						id="inputSearch" onkeypress="enterkey(event);">
					<div class="btn" onclick="searchSubmit1()">
						<img src="./images/visual/Icon material-twotone-saved-search.svg"
							alt="">
					</div>
				</div>
			</div>
			</form>
			
			<div class="title_info">
				<img src="./images/visual/info01.png" alt="" class="mb30"> <img
					src="./images/visual/info02.png" alt="" class="mb20"> <img
					src="./images/visual/info03.png" alt="">
			</div>
		</div>
	</section>

	<section id="find_business" class="content">
		<div class="inner">
			<div class="wrap mb50">
				<h1>착한가격모범식당업소 찾기</h1>
				<p>
					<a href="searchPage.jsp">전체보기 +</a>
				</p>
			</div>
			<div class="mb70">
				<div class="wrap">
					<form action="searchPage.jsp" method="get" id="search_form2">
					<div class="wrap_s">
						<div class="item">
							<div class="col3">
								<div class="field">
									<div class="td">
										<label style="display: none">업종</label>
										<select name="search_restaurant_sector" >
											<option value="" selected>업종 전체</option>
											<%
											RestaurantSectorDAO restaurantSectorDAO = new RestaurantSectorDAO();
											List<RestaurantSectorDTO> restaurantSectorList = restaurantSectorDAO.getRestaurantSectorList();
											for (RestaurantSectorDTO restaurantSector : restaurantSectorList) {
											%>
											<option value=<%=restaurantSector.getRestaurantSectorId()%>><%=restaurantSector.getRestaurantSectorName()%></option>
											<%
											}
											%>
										</select>
									</div>

									<div class="td ml30">
										<label style="display: none">인증 구분</label> 
										<select name="search_certification" >
											<option value="" selected>인증 전체</option>
											<%
											CertificationDAO certificationDAO = new CertificationDAO();
											List<CertificationDTO> certificationList = certificationDAO.getCertificationList();
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

						<div class="wrap ml30">
							<div class="btn2">
								<div class="center">
									<img src="./images/content/main/Icon ion-ios-search.svg" alt="">
									<h3 class="ml10" onclick="searchSubmit2()">검색하기</h3>
								</div>
							</div>
						</div>
					</div>
					</form>
					<div class="swiper_btn wrap">
						<div class="swiper-button-prev">
							<img src="./images/content/main/Icon akar-chevron-left-small.svg"
								alt="">
						</div>
						<div class="swiper-button-stop ml30">
							<img src="./images/content/main/Icon akar-two-line-vertical.svg"
								alt="">
						</div>
						<div class="swiper-button-next ml30">
							<img
								src="./images/content/main/Icon akar-chevron-right-small.svg"
								alt="">
						</div>
					</div>
				</div>
			</div>




			<div class="swiper-container business_list">
				<div class="swiper-wrapper">

					<%
					RestaurantDAO restaurantDAO = new RestaurantDAO();
					ConvenienceDAO convenienceDAO = new ConvenienceDAO();

					List<RestaurantDTO> restaurantList = restaurantDAO.findRestaurantList();
					for (RestaurantDTO restaurant : restaurantList) {
					%>
					<div class="swiper-slide box"
					onclick="location.href='detailPage.jsp?restaurantId=<%=restaurant.getRestaurantId() %>'">
						<div class="pic">
							<img
								src="./images/content/main/restaurant_img/restaurant<%=restaurant.getRestaurantId()%>.jpg"
								alt="">
						</div>
						<div class="info">
							<div class="wrap">
								<div class="title_name" ><%=restaurant.getRestaurantName()%></div>
								<div class="title_scor wrap">
									<div class="star">
										<img src="./images/content/main/Icon fa-solid-star.svg" alt="">
									</div>
									<p class="scor ml10"><%=restaurant.getStarScore()%></p>
								</div>
							</div>
							<div class="title_phon wrap_s mb20">
								<img src="./images/content/main/Icon fa-solid-phone-flip.svg"
									alt="">
								<p class="ml10"><%=restaurant.getRestaurantTel()%></p>
							</div>
							<div class="wrap_s mb30">
								<div class="title_menu" data-max-chars="7"><%=restaurant.getMenuName()%></div>
								<script>
							        document.addEventListener("DOMContentLoaded", function() {
							            const elements = document.querySelectorAll('.info .title_menu');
							
							            elements.forEach(function(element) {
							                const maxChars = parseInt(element.getAttribute('data-max-chars'), 10);
							                const text = element.textContent;
							
							                if (text.length > maxChars) {
							                    element.textContent = text.substring(0, maxChars) + '...';
							                }
							            });
							        });
    							</script>
								<div class="title_price ml20"><%=restaurant.getMenuPrice()%>원
								</div>
							</div>
							<ul class="title_submenu wrap_s">
								<%
								List<ConvenienceDTO> convenienceList = convenienceDAO.getConvenienceListByRestaurantId(restaurant.getRestaurantId());
								if (convenienceList != null) {
									for (ConvenienceDTO convenience : convenienceList) {
										if (convenience.getConvenienceId() > 0) {
								%>
								<li class="lnb"><%=convenience.getConvenienceName()%></li>
								<%
								}
								}
								}
								%>
							</ul>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
	</section>

	<section id="business_update" class="content">
		<div class="inner">
		<div class="wrap mb50">
			<div class="wrap">
				<h1>폐업가게 업데이트</h1>
			</div>
			<div class="wrap">
				
				<div class="swiper_btn wrap">
					<div class="swiper-button-prev">
						<img src="./images/content/main/Icon akar-chevron-left-small.svg"
							alt="">
					</div>
					<div class="swiper-button-stop ml30">
						<img src="./images/content/main/Icon akar-two-line-vertical.svg"
							alt="">
					</div>
					<div class="swiper-button-next ml30">
						<img src="./images/content/main/Icon akar-chevron-right-small.svg"
							alt="">
					</div>
				</div>
			</div>
			</div>
			




			<div class="swiper-container business_list">
				<div class="swiper-wrapper">

					<%
					List<RestaurantDTO> shutDouwnRestaurantList = restaurantDAO.shutDownRestaurantList();
					String falseStr = "F";
					String pending = "P";
					for (RestaurantDTO shutDouwnRestaurant : shutDouwnRestaurantList) {
					%>
					<div class="swiper-slide box">
						<div class="info">
							<%
							if (shutDouwnRestaurant.getRestaurantState().equals(falseStr)) {
							%>
							<div class="title_approval">승인완료</div>
							<%
							} else if (shutDouwnRestaurant.getRestaurantState().equals(pending)) {
							%>
							<div class="title_approval active">승인대기</div>
							<%
							}
							%>
							<div class="wrap">
								<div class="title_name mb20"><%=shutDouwnRestaurant.getRestaurantName()%></div>
							</div>
							<div class="title_phon wrap_s mb20">
								<img src="./images/content/main/Icon fa-solid-phone-flip.svg"
									alt="">
								<p class="ml10"><%=shutDouwnRestaurant.getRestaurantTel()%></p>
							</div>
						</div>
					</div>
					<%
					}
					%>

				</div>
				</div>
			</div>
	</section>

	<section id="price_comparison" class="content">
		<div class="inner">
			<h1 class="mb50">주요 외식메뉴 가격 비교</h1>
			<div class="wrap mb40">
				<%
				MenuSectorDAO menuSectorDAO = new MenuSectorDAO();
				List<MenuSectorDTO> menuSectorList = menuSectorDAO.getMenuSectorList();
				for (MenuSectorDTO menuSector : menuSectorList) {
					if (menuSector.getMenuSectorId() <= 8) {
				%>
				<div class="box">
					<div class="pic">
						<img
							src="./images/content/main/menu_icon/icon_tab<%=menuSector.getMenuSectorId()%>.svg"
							alt="">
					</div>
					<p class="menu_name"><%=menuSector.getMenuSectorName()%></p>
					<p class="menu_price"><%=menuSector.getMenuSectorPrice()%>원
					</p>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</section>

	<section id="digital_dashboard" class="content">
		<div class="inner">
			<h1 class="mb50">디지털 대시보드</h1>
			<div class="wrap">
				<div class="info">
					<div class="box mb40">
						<div class="wrap mb30">
							<p class="title">착한 식당 수</p>
							<p class="unit">(단위 : 계)</p>
						</div>
						
						<%
		                List<RestaurantDTO> countryCountList = restaurantDAO.findCountryCount();
		                if (countryCountList != null && !countryCountList.isEmpty()) {
		                    RestaurantDTO counts = countryCountList.get(0);
						%>
						<p class="scor"><%=counts.getCountCityKind()%></p>
						<%
		                }
						%>
					</div>
					<div class="box">
						<div class="wrap mb30">
							<p class="title">모범 식당 수</p>
							<p class="unit">(단위 : 계)</p>
						</div>
						<%
			                if (countryCountList != null && !countryCountList.isEmpty()) {
			                    RestaurantDTO counts = countryCountList.get(0);
			            %>
						<p class="scor"><%=counts.getCountCityExample()%></p>
						<%
			                }
						%>
						
					</div>
				</div>
				
				
				
					<%
					String jsonRestaurantList = new Gson().toJson(restaurantList);
					%>


					<div id="map" style="width: 800px; height: 400px;">
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd47fc85028b09033fe0cae55378ec24&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map'); // 지도를 표시할 div
							var mapOption = {
								center : new kakao.maps.LatLng(36.350411, 127.384548), // 지도의 중심좌표 (초기값)
								level : 10
							// 지도의 확대 레벨
							};

							// 지도를 생성합니다
							var map = new kakao.maps.Map(mapContainer, mapOption);
							var geocoder = new kakao.maps.services.Geocoder();
							var markers = [];

							// 서버에서 전달된 JSON 데이터를 파싱하여 JavaScript 객체로 변환
							var restaurantList =<%=jsonRestaurantList%>;

							// 주소 문자열에서 불필요한 줄 바꿈 및 공백 제거 함수
							function cleanAddress(address) {
								address = address.replace(/\([^)]*\)/g, '').trim();
								address = address.replace(/\d+~\d+호/g, '');

								return address.trim();
							}

							// 각 레스토랑의 주소를 가져와서 지도에 마커 표시하기
							restaurantList.forEach(function(restaurant) {
										var restaurantId = restaurant.restaurantId;
										var restaurantName = restaurant.restaurantName;
										var restaurantAddress = cleanAddress(restaurant.restaurantAddress);

										geocoder
												.addressSearch(
														restaurantAddress,
														function(result, status) {
															if (status === kakao.maps.services.Status.OK) {
																var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

																// 마커의 이미지 정보 설정
																var imageSrc = restaurantId >= 101 ? 'images/blue_mark.svg'
																		: 'images/green_mark.svg'; // 수정: restaurantId를 기준으로 이미지 설정
																var imageSize = new kakao.maps.Size(55, 60); // 마커이미지의 크기입니다
																var imageOption = {offset : new kakao.maps.Point(27,60)}; // 마커이미지의 옵션입니다

																// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
																var markerImage = new kakao.maps.MarkerImage(
																		imageSrc,
																		imageSize,
																		imageOption);

																// 결과값으로 받은 위치를 마커로 표시합니다
																var marker = new kakao.maps.Marker(
																		{
																			map : map,
																			position : coords,
																			image : markerImage
																		// 마커이미지 설정
																		});

																markers.push(marker);

																// 인포윈도우로 장소에 대한 설명을 표시합니다
																var infowindow = new kakao.maps.InfoWindow(
																		{
																			content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																					+ restaurantName
																					+ '</div>'
																		});
																infowindow.open(map, marker);

																// 마커 클릭 시 인포윈도우 표시
																kakao.maps.event.addListener(marker,'click',
																		function() {
																				infowindow.open(map,marker);
																		});

																// 모든 마커가 표시된 후에 지도의 중심을 설정합니다
																if (markers.length === restaurantList.length) {
																	var bounds = new kakao.maps.LatLngBounds();
																	for (var i = 0; i < markers.length; i++) {
																		bounds.extend(markers[i].getPosition());
																	}map.setBounds(bounds);
																}
															} else {
																console.log('주소 검색에 실패했습니다. 주소: ' + restaurantAddress);
															}
														});
									});
						</script>
					</div>


				</div>
			</div>
	</section>
	<script>
		function searchSubmit1(){
			document.getElementById('search_form1').submit();
		}
		function searchSubmit2(){
			document.getElementById('search_form2').submit();
		}
	</script>
</body>
</html>