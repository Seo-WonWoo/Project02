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
		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("pw");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = memberDAO.findMemberByIdAndPw(memberId, memberPw);
		
		if(member.getMemberState().equals('T')){
			session.setAttribute("loginId", member.getMemberId());
	%>
			<script>
				alert('로그인 성공');
				location.href = "mainPage.jsp";	
			</script>
	<%
		} else {
	%>
			<script>
				alert('로그인 실패');
				history.back();
			</script>
	<%
		}
	%>	
	
</body>
</html>