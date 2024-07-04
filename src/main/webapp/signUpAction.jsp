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
		String memberId = request.getParameter("id_signUp"); //아이디 파라메터값 문자열 저장
		String memberPw = request.getParameter("pw_signUp"); //비밀번호 파라메터값 문자열 저장
		String memberName = request.getParameter("name_signUp"); //이름 파라메터값 문자열 저장
		String memberJuminNumber = request.getParameter("jumin_signUp"); //주민번호 파라메터값 문자열 저장
		String memberTel = request.getParameter("tel_signUp"); //전화번호 파라메터값 문자열 저장
		String memberAddress = request.getParameter("address_signUp"); //주소 파라메터값 문자열 저장
		
		
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.addMember(memberId, memberPw, memberName, memberJuminNumber, memberTel, memberAddress); //회원 등록 함수 실행
		
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