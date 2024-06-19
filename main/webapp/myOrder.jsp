<%@page import="com.Dao.BookOrderImp"%>
<%@page import="com.entity.book_order"%>
<%@page import="com.Dao.BookOrderDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.Dao.CartDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.Dao.CardDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
.color-b {
	background-color: blue;
	color: white;
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="AllComponent/navbar.jsp"%>
	<h3 class="text-center text-primary">Your Order</h3>

	<table class="table table-striped mt-4">
		<thead>
			<tr class="header color-b">
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone</th>
				<th scope="col">Book No.</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<%
			User user = (User) session.getAttribute("userobj");
			int id = user.getId();
			BookOrderDao bdo = new BookOrderImp(DBConnect.getConnection());
			List<book_order> list = bdo.getBook(user.getEmail());
			for (book_order b : list) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<th><%=b.getUser_name()%></th>
				<th><%=b.getEmail()%></th>
				<th><%=b.getAddress()%></th>
				<th><%=b.getPhone()%></th>
				<th><%=b.getBook_name()%></th>
				<th><%=b.getAuthor()%></th>
				<th><%=b.getPrice()%></th>
				<th><%=b.getPayment()%></th>
				<th></th>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

	<div style="margin-top: 450px;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>