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
				
		try{ //등록회원 존재할 경우 다음 진행
			
			if(member.getMemberState().equals(awakeState)){	//등록회원이 정상상태 경우(로그인 진행)
				session.setAttribute("loginId", memberId);	//로그인아이디 세션 등록
				
				if(member.getMemberPosition().equals(managerPosition)){
					session.setAttribute("loginPosition", managerPosition); //로그인회원직급(관리자) 세션 등록
				} else {
					session.setAttribute("loginPosition", generalPosition); //로그인회원직급(일반회원) 세션 등록
				}
	%>
				<script>
						alert('로그인 성공');					
						location.href = "mainPage.jsp";
				</script>
	<%
			} else{	//등록회원이 휴먼상태 경우
	%>
				<script>
				let isSleepAccount = confirm('현재 휴먼 계정으로 로그인이 불가합니다.\n휴먼해제 신청 하시겠습니까?');
				if(isSleepAccount){	//등록회원 휴먼상태 해제 신청
					location.href = "sleepAccountAction.jsp?memberNumber=<%=member.getMemberNumber()%>&memberState=P";
				} else{	//신청 미동의(돌아가기)
					history.back();
				}	
				</script>
	<%
			}
		} catch(NullPointerException e) {	//등록회원 없을 경우 로그인 실패(예외처리)
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