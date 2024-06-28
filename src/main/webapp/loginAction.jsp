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
		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("pw");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = memberDAO.findMemberByIdAndPw(memberId, memberPw);
		
		String awakeState = "T";
		String managerPosition = "M";
		String generalPosition = "G"; 
		
		if(member.getMemberState().equals(awakeState)){
			session.setAttribute("loginId", memberId);
			if(member.getMemberPosition().equals(managerPosition)){
				session.setAttribute("loginPosition", managerPosition);
			} else {
				session.setAttribute("loginPosition", managerPosition);
			}
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