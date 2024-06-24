<%@ page import="db.dto.CityDTO"%>
<%@ page import="db.dao.CityDAO"%>
<%@ page import="db.dto.CountryDTO"%>
<%@ page import="db.dao.CountryDAO"%>
<%@ page import="db.dto.DongDTO"%>
<%@ page import="db.dao.DongDAO"%>
<%@ page import="db.dto.ConvenienceDTO"%>
<%@ page import="db.dao.ConvenienceDAO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 검색 데이터베이스 정보 자바스크립트 배열 객체 내 저장 -->
	<!-- 배열 객체(시, 군, 동, 편의기능) 생성 -->
	<script>
		let cityList = new Array();
		let countryList = new Array();
		let dongList = new Array();
		let convenience = new Array();
	</script>
	
	<!-- 시 정보 데이터베이스 자바 객체 클래스 생성 및 자바스크립트 객체 배열 정보 추가 -->
	<%
		CityDAO cityDAO = new CityDAO();
		List<CityDTO> cityList = cityDAO.getCityList();	
		for(CityDTO city : cityList){
	%>
			<script>
					cityList.push( { cityId : <%=city.getCityId()%>,
									 cityName : "<%=city.getCityName()%>"
								   } );
			</script>
	<%
		}
	%>
	
	<!-- 군 정보 데이터베이스 자바 객체 클래스 생성 및 자바스크립트 객체 배열 정보 추가 -->	
	<%
		CountryDAO countryDAO = new CountryDAO();
		List<CountryDTO> countryList = countryDAO.getCountryList();	
		for(CountryDTO country : countryList){
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
		for(DongDTO dong : dongList){
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

	
	<!-- 검색 select 입력 생성 -->	
	<select name="surch_city" id="city_select" size="1" onclick="countryListByCitySelect()">
    	<option value="" selected>전체</option>
    <%
    	for(CityDTO city : cityList){
    %>
    		<option value=<%=city.getCityId()%> ><%=city.getCityName()%></option>
    <%	
    	}    
    %>    	
	</select><br>
	
	<select name="surch_country" id="country_select" size="1" onclick="dongListByCountrySelect()">
    	<option value="" selected>전체</option>
	</select><br>
	
	<select name="surch_dong" id="dong_select" size="1">
    	<option value="" selected>전체</option>
	</select><br>
	
	
	<!-- 동 정보 데이터베이스 자바 객체 클래스 생성 및 자바스크립트 객체 배열 정보 추가 -->
	<%
		ConvenienceDAO convenienceDAO = new ConvenienceDAO();
		List<ConvenienceDTO> convenienceList = convenienceDAO.getConvenienceList();
	%>
	<fieldset>
		<legend>편의 기능</legend>
	
	
	<%
		for(ConvenienceDTO convenience : convenienceList){
	%>	
            <label>
                <input type="checkbox" name='<%=convenience.getConvenienceId()%>' value=<%=convenience.getConvenienceId()%>><%=convenience.getConvenienceName() %>
            </label><br>
	<%
		}
	%>
	</fieldset>
	
	
	
	
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
		
		
	</script>	
	
	
</body>
</html>