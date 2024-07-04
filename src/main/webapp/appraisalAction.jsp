<%@ page import="db.dao.StarScoreDAO" %>
<%@ page import="db.dto.AppraisalDTO"%>
<%@ page import="db.dao.AppraisalDAO"%>
<%@ page import="db.dto.MemberDTO"%>
<%@ page import="db.dao.MemberDAO"%>
<%@ page import="db.dto.MemberAppraisalDTO"%>
<%@ page import="db.dao.MemberAppraisalDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
		if(session.getAttribute("loginId") == null){ //로그아웃 경우(리뷰평가 불가)
	%>	
		<script>
			alert('로그인이 필요합니다.');
			location.href="login.jsp";
		</script>
				
	<%		
		} else{ //로그인 경우
			String loginId = session.getAttribute("loginId").toString(); //로그인 아이디 문자열 저장
			
			request.setCharacterEncoding("UTF-8"); //문자인코딩 설정  한글깨짐 방지
			//업소아이디 파라메터 값 정수 변수 저장
			int restId = (request.getParameter("restaurant_id") != null && !request.getParameter("restaurant_id").isEmpty()) ? Integer.parseInt(request.getParameter("restaurant_id")) : 0;
			//현재 별점 파라메터 값 실수 변수 저장
			double starScore = (request.getParameter("star_score") != null && !request.getParameter("star_score").isEmpty()) ? Double.parseDouble(request.getParameter("star_score")) : 0;
			//현재 별점평가갯수 파라메터 값 실수 변수 저장
			int starCount = (request.getParameter("star_count") != null && !request.getParameter("star_count").isEmpty()) ? Integer.parseInt(request.getParameter("star_count")) : 0;		
			//별점평가 파라메터 값 실수 변수 저장
			int sStarScore = (request.getParameter("select_star_score") != null && !request.getParameter("select_star_score").isEmpty()) ? Integer.parseInt(request.getParameter("select_star_score")) : 0;
			
			int sApprCheckCount;
			
			
			MemberDAO memberDAO = new MemberDAO();
			MemberDTO member = memberDAO.findMemberById(loginId); //로그인 아이디로 등록회원 호출 함수 실행 및 저장
			
			MemberAppraisalDAO memberAppraisalDAO = new MemberAppraisalDAO();
			//회원번호 및 업소아이디로 리뷰평가 이력 호출함수 실행 및 저장
			MemberAppraisalDTO memberAppraisal = memberAppraisalDAO.findMemberAppraisalByMemberNumberAndRestaurantId(member.getMemberNumber(), restId);
						
			if(memberAppraisal == null){ //리뷰평가 이력 존재하지 않을 경우(평가 가능)
				
				List<Integer> sApprList = new ArrayList<Integer>();
				for(int i=1; i<30; i++){
					//리뷰항목평가 파라메터 값 리스트 변수 저장 
					int sAppr = (request.getParameter("select"+i) != null && !request.getParameter("select"+i).isEmpty()) ? i  : 0;
					sApprList.add(sAppr);
				}
				
				StarScoreDAO starScoreDAO = new StarScoreDAO();
				//업소아이디, 현재별점, 현재별점평가갯수, 별점평가로 데이터베이스 테이블 업소 별점 수정함수 실행
				int resultStarScore = starScoreDAO.modifyStarScore(restId, starScore, starCount, sStarScore);
				
				int resultAppraisal = 0;
				
				AppraisalDAO appraisalDAO = new AppraisalDAO(); 
				//업소아이디로 현재 평가항목 리스트 호출함수 실행 및 리스트 변수 저장
				List<AppraisalDTO> appraisal = appraisalDAO.getAppraisalListByRestaurantId(restId);
				for(AppraisalDTO appraisalItem : appraisal){
					for(int sAppr : sApprList){
						if(sAppr == appraisalItem.getAppraisalId()){ //리뷰평가항목과 현재리뷰항목이 일치한 경우 데이터베이스 테이블 해당리뷰항목 카운트 1 증가 수정 적용 
							sApprCheckCount = appraisalItem.getAppraisalCheckCount() + 1;
							int result = appraisalDAO.modifyAppraisal(restId, sAppr, sApprCheckCount);
							if(result != 0){
								resultAppraisal++;
							}
						}	
					}
				}
				
				if(resultStarScore > 0 || resultAppraisal > 0){ //별점과 리뷰항목 수정이 정상 적용 경우
					memberAppraisalDAO.addMemberAppraisal(member.getMemberNumber(), restId);
					
	%>
						<script>
							alert('평가 적용 완료');
							location.href="detailPage.jsp?restaurantId=<%=restId%>";
						</script>
					
	<%			
				} else{
	%>
						<script>			
							alert('평가 적용 실패');
							history.back();
						</script>		
	<%
				}
	
				
			} else {				
	%>		
				<script>
					alert('이미 평가 하셨습니다.');
					history.back();
				</script>
	<%	
			}
		}
	%>		
			
			
	
	
</body>
</html>