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
	// restaurantId 파라미터를 받아온다
	int restId = (request.getParameter("restaurantId") != null && !request.getParameter("restaurantId").isEmpty())
			? Integer.parseInt(request.getParameter("restaurantId"))
			: 0;
	
	RestaurantDAO restaurantDAO = new RestaurantDAO();
	int result = restaurantDAO.modifyShutDownRestaurantStatebyRestaurantId(restId);
	
	
	if(result > 0){
	%>
		<script>
			alert('폐업처리 완료');
			location.href="restaurantManagePage.jsp";
		</script>
	
	<%			
		} else{
	%>
		<script>			
			alert('폐업처리 실패');
			history.back();
		</script>		
	<%
		}
	%>

</body>
</html>