<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8"); //문자인코딩 설정  한글깨짐 방지
		
		int sCity = (request.getParameter("surch_city") != null && !request.getParameter("surch_city").isEmpty()) ? Integer.parseInt(request.getParameter("surch_city")) : 0;
		int sCountry = (request.getParameter("surch_country") != null && !request.getParameter("surch_country").isEmpty()) ? Integer.parseInt(request.getParameter("surch_country")) : 0;
		int sDong = (request.getParameter("surch_dong") != null && !request.getParameter("surch_dong").isEmpty()) ? Integer.parseInt(request.getParameter("surch_dong")) : 0;
		int sRS = (request.getParameter("surch_restaurant_sector") != null && !request.getParameter("surch_restaurant_sector").isEmpty()) ? Integer.parseInt(request.getParameter("surch_restaurant_sector")) : 0;
		int sCert = (request.getParameter("surch_certification") != null && !request.getParameter("surch_certification").isEmpty()) ? Integer.parseInt(request.getParameter("surch_certification")) : 0;

		int sConv1 = (request.getParameter("surch_convenience_1") != null && !request.getParameter("surch_convenience_1").isEmpty()) ? 1  : 0;
		int sConv2 = (request.getParameter("surch_convenience_2") != null && !request.getParameter("surch_convenience_2").isEmpty()) ? 2  : 0;
		int sConv3 = (request.getParameter("surch_convenience_3") != null && !request.getParameter("surch_convenience_3").isEmpty()) ? 3  : 0;
		int sConv4 = (request.getParameter("surch_convenience_4") != null && !request.getParameter("surch_convenience_4").isEmpty()) ? 4  : 0;
		int sConv5 = (request.getParameter("surch_convenience_5") != null && !request.getParameter("surch_convenience_5").isEmpty()) ? 5  : 0;
		int sConv6 = (request.getParameter("surch_convenience_6") != null && !request.getParameter("surch_convenience_6").isEmpty()) ? 6  : 0;
		int sConv7 = (request.getParameter("surch_convenience_7") != null && !request.getParameter("surch_convenience_7").isEmpty()) ? 7  : 0;
		int sConv8 = (request.getParameter("surch_convenience_8") != null && !request.getParameter("surch_convenience_8").isEmpty()) ? 8  : 0;
		
		String sRN = request.getParameter("surch_restaurant_name");
		String sKW = request.getParameter("surch_keyword");
		
	%>


</body>
</html>