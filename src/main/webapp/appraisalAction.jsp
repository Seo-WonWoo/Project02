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
		if(session.getAttribute("loginId") == null){
	%>	
		<script>
			alert('로그인이 필요합니다.');
			location.href="login.jsp";
		</script>
				
	<%		
		} else{
			String loginId = session.getAttribute("loginId").toString();
			
			request.setCharacterEncoding("UTF-8"); //문자인코딩 설정  한글깨짐 방지
			int restId = (request.getParameter("restaurant_id") != null && !request.getParameter("restaurant_id").isEmpty()) ? Integer.parseInt(request.getParameter("restaurant_id")) : 0;
			double starScore = (request.getParameter("star_score") != null && !request.getParameter("star_score").isEmpty()) ? Double.parseDouble(request.getParameter("star_score")) : 0;
			int starCount = (request.getParameter("star_count") != null && !request.getParameter("star_count").isEmpty()) ? Integer.parseInt(request.getParameter("star_count")) : 0;		
			
			int sStarScore = (request.getParameter("select_star_score") != null && !request.getParameter("select_star_score").isEmpty()) ? Integer.parseInt(request.getParameter("select_star_score")) : 0;
	
			int sApprCheckCount;
			
			
			MemberDAO memberDAO = new MemberDAO();
			MemberDTO member = memberDAO.findMemberById(loginId);
			
			MemberAppraisalDAO memberAppraisalDAO = new MemberAppraisalDAO();
			MemberAppraisalDTO memberAppraisal = memberAppraisalDAO.findMemberAppraisalByMemberNumberAndRestaurantId(member.getMemberNumber(), restId);
			
			if(memberAppraisal == null){
				
				List<Integer> sApprList = new ArrayList<Integer>();
				for(int i=1; i<30; i++){
					int sAppr = (request.getParameter("select"+i) != null && !request.getParameter("select"+i).isEmpty()) ? i  : 0;
					sApprList.add(sAppr);
				}
				
				StarScoreDAO starScoreDAO = new StarScoreDAO();
				int resultStarScore = starScoreDAO.modifyStarScore(restId, starScore, starCount, sStarScore);
				
				int resultAppraisal = 0;
				
				AppraisalDAO appraisalDAO = new AppraisalDAO(); 
				List<AppraisalDTO> appraisal = appraisalDAO.getAppraisalListByRestaurantId(restId);
				for(AppraisalDTO appraisalItem : appraisal){
					for(int sAppr : sApprList){
						if(sAppr == appraisalItem.getAppraisalId()){
							sApprCheckCount = appraisalItem.getAppraisalCheckCount() + 1;
							int result = appraisalDAO.modifyAppraisal(restId, sAppr, sApprCheckCount);
							if(result != 0){
								resultAppraisal++;
							}
						}	
					}
				}
				
				if(resultStarScore > 0 || resultAppraisal > 0){
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