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
	String pendingState = "P";
	String awakeState = "T";
	
	int result1 = 0;
	int result2 = 0;
	
	MemberDAO memberDAO = new MemberDAO();
	
	if(memberState.equals(awakeState)) {
		result1 = memberDAO.modifySleepAccountMemberbyMemberNumber(memberNumber);
	} else if(memberState.equals(pendingState)){
		result2 = memberDAO.modifySleepAccountMemberSubmitbyMemberNumber(memberNumber);
	} else if(memberState.equals(sleepAccountState)){
		result1 = memberDAO.modifyAwakeMemberbyMemberNumber(memberNumber);
	}
	
	if(result1 > 0){
	%>
		<script>
			alert('회원상태처리 완료');
			location.href="memberManagePage.jsp";
		</script>
	<%
	} else if(result2 > 0){
	%>
		<script>
			alert('휴먼해제 신청되었습니다\n관리자 승인후 로그인 가능합니다');
			location.href="mainPage.jsp";
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
