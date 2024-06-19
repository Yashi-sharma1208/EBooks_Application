<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.admin.servlet.BookDaoImp"%>
<%@page import="com.admin.servlet.BookDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Book"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book:admin</title>
<%@include file="allCss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<!-- Securtiy code  -->

	<c:if test="${ empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>


	<div style="background-color: #f0f2f2" class="mb-4">
		<div class="container">
			<div class="row">
				<div class="col-md-5 offset-md-4">
					<div class="card mt-4">
						<div class="card-body">
							<h3 class="text-center text-danger">Edit BOOKS</h3>

							<!-- get form details  -->
							<%
							int id = Integer.parseInt(request.getParameter("id"));
							BookDaoImp bd = new BookDaoImp(DBConnect.getConnection());
							Book book = bd.getBookById(id);
							%>

							<form action="../editBooks" method="post">
								<input type="hidden" name="id" value="<%=book.getBookId()%>">
								<div class="form-group">
									<label for="exampleInputPassword1" class="bold">Book
										Name</label> <input type="text" class="form-control"
										id="exampleInputPassword1" required name="bname"
										value=<%=book.getBookName()%>>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1" class="bold">Author
										Name </label> <input type="text" class="form-control"
										id="exampleInputEmail1" required aria-describedby="emailHelp"
										name="aname" value=<%=book.getAuthor()%>> <small
										id="emailHelp" class="form-text text-muted"></small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" class="bold">Price</label> <input
										type="number" class="form-control" id="exampleInputPassword1"
										required name="price" value=<%=book.getPrice()%>>
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1" class="bold">Book
										Status</label> <select name="bstatus" class="form-control">
										<%
										if ("active".equals(book.getStatus())) {
										%>
										<option value="active">Active</option>
										<option value="inactive">Inactive</option>

										<%
										} else {
										%>

										<option value="active">Active</option>
										<option value="inactive">Inactive</option>
										<%
										}
										%>


									</select>
								</div>
								<button type="submit" class="btn btn-primary">Update</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 6%;">
			<%@include file="footer.jsp"%>
		</div>
</body>
</html>