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
		//로그인 입력(아이디, 비밀번호) 파라메터값 처리
		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("pw");
		
		//아이디, 비밀번호 매개변수로 회원 호출 함수 실행
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = memberDAO.findMemberByIdAndPw(memberId, memberPw);
		
		String awakeState = "T";
		String managerPosition = "M";
		String generalPosition = "G"; 
		
		//호출결과, 등록회원 존재할 경우 로그인 진행
		try{
			
			if(member.getMemberState().equals(awakeState)){
				session.setAttribute("loginId", memberId);
				
				if(member.getMemberPosition().equals(managerPosition)){
					session.setAttribute("loginPosition", managerPosition);
				} else {
					session.setAttribute("loginPosition", generalPosition);
				}
	%>
				<script>
						alert('로그인 성공');					
						location.href = "mainPage.jsp";
				</script>
	<%
			} else{
	%>
				<script>
				let isSleepAccount = confirm('현재 휴먼 계정으로 로그인이 불가합니다.\n휴먼해제 신청 하시겠습니까?');
				if(isSleepAccount){
					location.href = "sleepAccountAction.jsp?memberNumber=<%=member.getMemberNumber()%>&memberState=P";
				} else{
					history.back();
				}	
				</script>
	<%
			}
		} catch(NullPointerException e) {
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