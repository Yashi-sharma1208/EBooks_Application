<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.admin.servlet.BookDaoImp"%>
<%@page import="com.admin.servlet.BookDao"%>
<%@page import="com.db.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin All books</title>
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
	
	<!-- Securtiy code 

<c:if test="${ empty userobj }">
<c:redirect url="../login.jsp" />
</c:if>
-->

<h2 class="text-center text-danger mt-4 mb-4">Hello Admin</h2>	
<!-- ALERT FOR UPDATION -->
	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">Book Updated Successfully..</h5>
	</c:if>
	<c:remove var="succMsg" scope="session" />


	<c:if test="${not empty failMsg }">
		<h5 class="text-center text-danger">Book Can't Be Updated</h5>
	</c:if>
	<c:remove var="failMsg" scope="session" />

<!-- ALERT FOR DELETION -->

	<c:if test="${not empty succMsg1 }">
		<h5 class="text-center text-success">Book Deleted Successfully..</h5>
	</c:if>
	<c:remove var="succMsg1" scope="session" />


	<c:if test="${not empty failMsg1 }">
		<h5 class="text-center text-danger">Book Can't Be Deleted</h5>
	</c:if>
	<c:remove var="failMsg" scope="session" />



	<table class="table table-striped">
		<thead>
			<tr class="header">
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Categorie</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDao bd = new BookDaoImp(DBConnect.getConnection());
			List<Book> list = bd.getAllBooks();
			for (Book b : list) {
			%>

			<tr>

				<td><%=b.getBookId()%></td>
				<td><img src="../books/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="editBooks.jsp?id=<%=b.getBookId()%>"
					class="btn btn-primary text-white text-center mr-3"><i class="fas fa-edit">&nbsp; Edit</i></a> <a
					href="../delete?id=<%=b.getBookId() %>" class="btn btn-danger text-white text-center">
					<i class="fas fa-trash-alt">&nbsp;Delete</i>
					</a></td>
			</tr>
			<%
			}
			%>


		</tbody>
	</table>
	<div style="margin-top: 450px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>