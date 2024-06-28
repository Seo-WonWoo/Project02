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
		String memberId = request.getParameter("id_signUp");
		String memberPw = request.getParameter("pw_signUp");
		String memberName = request.getParameter("name_signUp");
		String memberJuminNumber = request.getParameter("jumin_signUp");
		String memberTel = request.getParameter("tel_signUp");
		String memberAddress = request.getParameter("address_signUp");
		
		
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.addMember(memberId, memberPw, memberName, memberJuminNumber, memberTel, memberAddress);
		
		if( result > 0 ){
	%>
			<script>
				alert('회원가입 성공');
				location.href = "mainPage.jsp";	
			</script>
	<%
		} else {
	%>
			<script>
				alert('회원가입 실패');
				history.back();
			</script>
	<%
		}
	%>	

</body>
</html>