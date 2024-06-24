<%@ page import="db.dao.ProductDAO" %>
<%@ page import="db.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ProductInfo.jsp</h1>	
	
	<%
		ProductDAO productDAO = new ProductDAO();
		List<ProductDTO> productList = productDAO.findProductList();
	%>
	<%
		for(ProductDTO product : productList){
	%>		
		<div class="deptItem">
			<h3><%=product.getP_code() %></h3>
			<p><%=product.getP_name()%> <%=product.getP_price()%></p>
			
		</div>
	<%
		}
	%>
</body>
</html>