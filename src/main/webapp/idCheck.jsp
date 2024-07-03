<%@ page import="db.dto.MemberDTO"%>
<%@ page import="db.dao.MemberDAO"%>
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
		String inputId = request.getParameter("input_id");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = memberDAO.findMemberById(inputId);
		
		if(member == null){			
	%>
		<script>
			alert('아이디 사용 가능');					
			location.href = "signUp.jsp?input_id=<%=inputId%>&check_id=1";
		</script>		
	<%	
		} else {
	%>
		<script>
			alert('아이디 사용 불가');					
			history.back();
		</script>	
	<%
		} 
	%>


</body>
</html>