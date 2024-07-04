<%@ page import="db.dto.RestaurantDTO"%>
<%@ page import="db.dao.RestaurantDAO"%>
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
		if(session.getAttribute("loginId") == null){ //로그아웃 경우 폐업신청 불가
	%>	
		<script>
			alert('로그인이 필요합니다.');
			location.href="login.jsp";
		</script>
				
	<%		
		} else{ //로그인 경우 폐업신청 진행
			request.setCharacterEncoding("UTF-8"); //문자인코딩 설정  한글깨짐 방지
	
			int restId = (request.getParameter("restaurant_id") != null && !request.getParameter("restaurant_id").isEmpty()) ? Integer.parseInt(request.getParameter("restaurant_id")) : 0;
			
			RestaurantDAO restaurantDAO = new RestaurantDAO();
			int result = restaurantDAO.modifyShutDownRestaurantSubmitbyRestaurantId(restId); //데이터베이스 해당업소 폐업처리신청 상태 변경
			
			if(result > 0){
	%>
				<script>
					alert('신청 완료');
					location.href="mainPage.jsp";
				</script>
	<%			
			} else{
	%>
				<script>			
					alert('신청 실패');
					history.back();
				</script>		
	<%
			}
		}
	%>
</body>
</html>