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
	// restaurantId 파라미터를 받아온다
	int memberNumber = (request.getParameter("memberNumber") != null && !request.getParameter("memberNumber").isEmpty())
			? Integer.parseInt(request.getParameter("memberNumber"))
			: 0;
	String memberState = request.getParameter("memberState");
	
	String sleepAccountState = "F";
	String awakeState = "T";
	
	int result = 0;
	
	MemberDAO memberDAO = new MemberDAO();
	
	if(memberState.equals(awakeState)) {
		result = memberDAO.modifySleepAccountMemberbyMemberNumber(memberNumber);
	} else if(memberState.equals(sleepAccountState)){
		result = memberDAO.modifyAwakeMemberbyMemberNumber(memberNumber);
	}
	
	if(result > 0){
	%>
		<script>
			alert('회원상태처리 완료');
			location.href="memberManagePage.jsp";
		</script>
	
	<%			
		} else{
	%>
		<script>			
			alert('회원상태처리 실패');
			history.back();
		</script>		
	<%
		}
	%>

</body>
</html>