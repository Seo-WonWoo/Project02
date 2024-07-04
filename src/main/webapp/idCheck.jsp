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
		String inputId = request.getParameter("input_id"); //아이디 입력값 문자열 변수 저장
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = memberDAO.findMemberById(inputId); //아이디값으로 등록회원 찾기 함수 실행
		
		if(member == null){ //등록회원이 없을 경우(아이디 중복 없음)			
	%>
		<script>
			alert('아이디 사용 가능');					
			location.href = "signUp.jsp?input_id=<%=inputId%>&check_id=1";
		</script>		
	<%	
		} else { //등록회원이 있을경우(아이디 중복)
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