<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.Book"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
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
	<h2 class="text-center text-success">RECENT BOOKS</h2>
	<!-- start recent book -->

	<c:if test="${not empty addCart}">
		<h5 class="text-center  text-success">${addCart }</h5>
	</c:if>
	<c:remove var="addCart" scope="session" />

	<c:if test="${not empty notadd}">
		<h5 class="text-center  text-danger">${notadd }</h5>
	</c:if>
	<c:remove var="notadd" scope="session" />


	<div class="container">

		<!-- Main card _______________________________ -->
<%
			User user = (User) session.getAttribute("userobj");
			%>
		<div class="row">
			<%
			BookDaoImp bd1 = new BookDaoImp(DBConnect.getConnection());
			List<Book> list1 = bd1.getRecentBook();
			for (Book b : list1) {
			%>
			<div class="col-md-3">

				<div class="card car-ho  mr-2 mt-3">
					<div class="card-body text-center">
						<img alt="" src="AllComponent/imgs/<%=b.getPhotoName()%>"
							style="width: 200px; height: 200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old") || b.getBookCategory().equals("oldBook")) {
							%>
							Categorie:<%=b.getBookCategory()%></p>
						<div class="row text-center">
							<a href="viewBook.jsp?id=<%=b.getBookId()%>" class="btn btn-success  btn-sm mr-3 ml-5">View</a> <a
								href="" class="btn btn-secondary my-2  mr-1 my-sm-0  borde">
								<i class="fas fa-rupee-sign"><%=b.getPrice()%></i>
							</a>
						</div>
						<%
						} else {
						%>
						Categorie:<%=b.getBookCategory()%></p>
						<div class="row text-center">
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger  btn-sm mr-3 ml-3">Add</a>
							<%
							} else {
							%>
							<a
								href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger  btn-sm mr-3 ml-3">Add</a>
							<%
							}
							%>
							<a href="viewBook.jsp?id=<%=b.getBookId()%>" class="btn btn-success  btn-sm mr-3">View</a> <a
								href="" class="btn btn-secondary my-2  mr-1 my-sm-0  borde">
								<i class="fas fa-rupee-sign"><%=b.getPrice()%></i>
							</a>
						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

	</div>

</body>
</html>