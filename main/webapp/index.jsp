<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@page import="com.entity.User"%>
<%@page import="com.entity.Book"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
.back-img {
	background:
		url("AllComponent/open-book-with-flower-grass_494741-20830.jpg");
	height: 60vh;
	width: 100vw;
	background-repeat: no-repeat;
	background-size: cover;
}

.car-ho:hover {
	background-color: #fcf7f7;
	box-shadow: 4px -3px 6px black;
}

.borde {
	background-color: black;
	color: white;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<!-- NAVBAR----------------------------------------------------------- -->

	<%@include file="AllComponent/navbar.jsp" %>
	<%
	User user = (User) session.getAttribute("userobj");
	%>
	<div class="container-fluid back-img">
		<h1 class="text-center text-danger">Ebook Management System</h1>
	</div>


	<!-- start recent book -->
	<div class="container">
		<h3 class="text-center  mt-4" id="recent">Recent Book</h3>
		<!-- Main card _______________________________ -->

		<div class="row">
			<%
			BookDaoImp bd1 = new BookDaoImp(DBConnect.getConnection());
			List<Book> list1 = bd1.getRecentBook();
			for (Book b : list1) {
			%>
			<div class="col-md-3">

				<div class="card car-ho">
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
							<a href="viewBook.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success  btn-sm mr-3 ml-5">View</a> <a href=""
								class="btn btn-light my-2  mr-1 my-sm-0  borde"> <i
								class="fas fa-rupee-sign"><%=b.getPrice()%></i></a>
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
							<a href="viewBook.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success  btn-sm mr-3">View</a> <a href=""
								class="btn btn-light my-2  mr-1 my-sm-0  borde"> <i
								class="fas fa-rupee-sign"><%=b.getPrice()%></i></a>
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
	<!-- CARD 1 __________________________________________________________________ -->
	<div class="text-center mt-4">
		<a href="all_recent.jsp"
			class="btn btn-danger btn-sm text-white text-center"> View All </a>
	</div>
	</div>
	</div>
	<!-- End recent book -->

	<!--  start New Book-->

	<div class="container">
		<h3 class="text-center  mt-4" id="newone">New Book</h3>
		<!-- Main card _______________________________ -->
		<div class="row">

			<%
			BookDaoImp bd = new BookDaoImp(DBConnect.getConnection());
			List<Book> list = bd.getNewBook();
			for (Book b : list) {
			%>
			<div class="col-md-3">
				<!-- single card body 1 -->
				<div class="card car-ho">
					<div class="card-body text-center">
						<img alt="" src="AllComponent/imgs/<%=b.getPhotoName()%>"
							style="width: 200px; height: 200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
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
							<a href="viewBook.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success  btn-sm mr-3">View</a> <a href=""
								class="btn btn-light my-2  mr-1 my-sm-0  borde"> <i
								class="fas fa-rupee-sign"><%=b.getPrice()%></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

	</div>
	<div class="text-center mt-3">
		<a href="all_newBook.jsp" class="btn btn-danger btn-sm text-white text-center">
			View All </a>
	</div>
	
	<!-- End new  book -->


	<!--  start old Book-->

	<div class="container">
		<h3 class="text-center  mt-4" id="oldone">Old Book</h3>
		<!-- Main card _______________________________ -->
		<div class="row">
			<%
			BookDaoImp bd2 = new BookDaoImp(DBConnect.getConnection());
			List<Book> list2 = bd2.getOldBook();
			for (Book b : list2) {
			%>
			<div class="col-md-3">
				<!-- single card body 1 -->
				<div class="card car-ho">
					<div class="card-body text-center">
						<img alt="" src="AllComponent/imgs/<%=b.getPhotoName()%>"
							style="width: 200px; height: 200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categorie:<%=b.getBookCategory()%></p>
						<div class="row text-center">
							<a
								href="viewBook.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success  btn-sm mr-3 ml-4">View</a> <a href=""
								class="btn btn-light my-2  mr-2 my-sm-0  borde"> <i
								class="fas fa-rupee-sign"><%=b.getPrice()%></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-4">
			<a href="all_oldBook.jsp" class="btn btn-danger btn-sm text-white text-center">
				View All </a>
		</div>
	</div>
	
	<!-- End old book -->



	<!-- FOOTER----------------------------------------------------------- -->
	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>