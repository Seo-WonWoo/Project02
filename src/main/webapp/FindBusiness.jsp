<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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


	<section class="container content">
		<div class="inner">

			<h2 class="sub_title mt40">착한가격안심가게업소 찾기</h2>

			<h3 class="select_title mt50">지역별검색</h3>

			<div class="store_search_box mt20">
				<div class="item">
					<div class="col3">
						<div class="field">
							<div class="th">시도</div>
							<div class="td">
								<label style="display: none">시도</label> <select>
									<option value="">전체</option>
									<option>서울특별시</option>
									<option>부산광역시</option>
									<option>대구광역시</option>
									<option>인천광역시</option>
									<option>광주광역시</option>
									<option>대전광역시</option>
									<option>울산광역시</option>
									<option>세종특별자치시</option>
									<option>경기도</option>
									<option>강원특별자치도</option>
									<option>충청북도</option>
									<option>충청남도</option>
									<option>전북특별자치도</option>
									<option>전라남도</option>
									<option>경상북도</option>
									<option>경상남도</option>
									<option>제주특별자치도</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col3">
						<div class="field">
							<div class="th">시군구</div>
							<div class="td">
								<label style="display: none">시군구</label> <select>
									<option value="">전체</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col3">
						<div class="field">
							<div class="th">업종</div>
							<div class="td">
								<label style="display: none">업종</label> <select>
									<option value="">전체</option>
									<option>한식_일반</option>
									<option>한식_한정식</option>
									<option>한식_면류</option>
									<option>한식_육류</option>
									<option>한식_찌개류</option>
									<option>한식_해산물</option>
									<option>한식_분식</option>
									<option>한식_기타</option>
									<option>일식</option>
									<option>양식</option>
									<option>중식</option>
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
									<input type="checkbox" name="AllcheckYn" id="AllcheckYn">
									<label for="AllcheckYn">전체</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="parkingYn" id="parkingYn">
									<label for="parkingYn">주차</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="packingYn" id="packingYn">
									<label for="packingYn">포장</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="dlvrYn" id="dlvrYn"> <label
										for="dlvrYn">배달</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="rsvtYn" id="rsvtYn"> <label
										for="rsvtYn">예약</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="mwmnToiletSeYn"
										id="mwmnToiletSeYn"> <label for="mwmnToiletSeYn">남/여
										화장실 구분</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="grpUsePosblYn" id="grpUsePosblYn">
									<label for="grpUsePosblYn">단체이용 가능</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="wrlessIntnetPvsnYn"
										id="wrlessIntnetPvsnYn"> <label
										for="wrlessIntnetPvsnYn">무선인터넷</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="componAnimalAcmpnyYn"
										id="componAnimalAcmpnyYn"> <label
										for="componAnimalAcmpnyYn">반려동물 동반</label>
								</div>
								<div class="icheck mar">
									<input type="checkbox" name="infntFcltyYn" id="infntFcltyYn">
									<label for="infntFcltyYn">유아시설</label>
								</div>
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
								<input type="text" name="bsshNm" id="bsshNm" value="">
							</div>
						</div>
					</div>
					<div class="col3">
						<div class="field">
							<div class="th">대표메뉴</div>
							<label for="keyword" style="display: none">대표메뉴</label>
							<div class="td">
								<input type="text" name="keyword" id="keyword" value="">
							</div>
						</div>
					</div>

				</div>
			</div>



			<table id="count" class="new_tbl_board tb01 mt100 mb80">
				<colgroup>
					<col style="width: 4%;">
					<col style="width: 15%;">
					<col style="width: 10%;">
					<col style="width: 10%;">
					<col style="width: 7%;">
					<col style="width: 25%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="hd">번호</th>
						<th scope="col" class="hd">업소명</th>
						<th scope="col" class="hd">주요품목</th>
						<th scope="col">가격</th>
						<th scope="col">평점</th>
						<th scope="col">주소</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>가마솥 선지국밥</td>
						<td>국밥</td>
						<td>4,000원</td>
						<td>
							<div class="wrap_s center">
								<img src="./images/content/sub/Icon fa-solid-star.svg" alt="">
								<p class="score">4.9</p>
							</div>
						</td>
						<td>충청남도 천안시 동남구 충무로 00000000000</td>
					</tr>
					<tr>
						<td>1</td>
						<td>가마솥 선지국밥</td>
						<td>국밥</td>
						<td>4,000원</td>
						<td>
							<div class="wrap_s center">
								<img src="./images/content/sub/Icon fa-solid-star.svg" alt="">
								<p class="score">4.9</p>
							</div>
						</td>
						<td>충청남도 천안시 동남구 충무로 00000000000</td>
					</tr>

					<tr>
						<td>1</td>
						<td>가마솥 선지국밥</td>
						<td>국밥</td>
						<td>4,000원</td>
						<td>
							<div class="wrap_s center">
								<img src="./images/content/sub/Icon fa-solid-star.svg" alt="">
								<p class="score">4.9</p>
							</div>
						</td>
						<td>충청남도 천안시 동남구 충무로 00000000000</td>
					</tr>

					<tr>
						<td>1</td>
						<td>가마솥 선지국밥</td>
						<td>국밥</td>
						<td>4,000원</td>
						<td>
							<div class="wrap_s center">
								<img src="./images/content/sub/Icon fa-solid-star.svg" alt="">
								<p class="score">4.9</p>
							</div>
						</td>
						<td>충청남도 천안시 동남구 충무로 00000000000</td>
					</tr>

					<tr>
						<td>1</td>
						<td>가마솥 선지국밥</td>
						<td>국밥</td>
						<td>4,000원</td>
						<td>
							<div class="wrap_s center">
								<img src="./images/content/sub/Icon fa-solid-star.svg" alt="">
								<p class="score">4.9</p>
							</div>
						</td>
						<td>충청남도 천안시 동남구 충무로 00000000000</td>
					</tr>

					<tr>
						<td>1</td>
						<td>가마솥 선지국밥</td>
						<td>국밥</td>
						<td>4,000원</td>
						<td>
							<div class="wrap_s center">
								<img src="./images/content/sub/Icon fa-solid-star.svg" alt="">
								<p class="score">4.9</p>
							</div>
						</td>
						<td>충청남도 천안시 동남구 충무로 00000000000</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>