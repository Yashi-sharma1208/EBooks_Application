<%@page import="com.entity.User"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.admin.servlet.BookDaoImp"%>
<%@page import="com.admin.servlet.BookDao"%>
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
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success " role="alert">${succMsg}</div>
	</c:if>
	<c:remove var="succMsg" scope="session" />

	<c:if test="${not empty failMsg }">
		<div class="alert alert-danger " role="alert">${failMsg}</div>
	</c:if>
	<c:remove var="failMsg" scope="session" />

	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white mt-4">
				<tr class="header">
					<th scope="col">Book Id</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				User use = (User) session.getAttribute("userobj");
				String email = use.getEmail();
				%>
				<%
				BookDao bd = new BookDaoImp(DBConnect.getConnection());
				List<Book> list = bd.getAllOldBookById(email, "Old Book");
				for (Book b : list) {
				%>
				<tr>
					<td><%=b.getBookId()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a href="deleteOld?book_id=<%=b.getBookId() %>&&user_email=<%=b.getUser_email() %>"
						class="btn btn-danger text-white text-center"> <i
							class="fas fa-trash-alt">&nbsp;Delete</i>
					</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>


	</div>

	<div style="margin-top: 450px;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>