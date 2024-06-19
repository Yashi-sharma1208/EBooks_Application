<%@page import="com.admin.servlet.BookDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.admin.servlet.BookDaoImp"%>
<%@page import="com.entity.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Books:admin</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
.header {
	background-color: black;
	color: white;
	font-weight: 500;
}

td {
	font-weight: 600;
	font-size: large;
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDao bd=new BookDaoImp(DBConnect.getConnection());
	Book book=bd.getBookById(id);
	%>

	<h2 class="text-center mb-4 mt-2 text-success">Hello Admin</h2>
	<table class="table table-striped">
		<thead>
			<tr class="header">
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Book Name</th>
					<th scope="col">Phone No.</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>

			</tr>

		</tbody>
	</table>

	<div style="margin-top: 450px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>