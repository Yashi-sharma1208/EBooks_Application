<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Book"%>
<%@page import="com.admin.servlet.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="AllComponent/navbar.jsp"%>
	<
	<div class="container">
		<div class="row">
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			BookDaoImp bd1 = new BookDaoImp(DBConnect.getConnection());
			Book book = bd1.getBookById(id);
			%>
			<input type="hidden" name="id" value="<%=book.getBookId()%>">
			<div class="col-md-6  text-center p-5 border mt-4 bg-white">
				<img alt="" src="AllComponent/imgs/<%=book.getPhotoName()%>"
					style="height: 200px; width: 200px;">
				<h4>
					Book Name:<span class="text-success"><%=book.getBookName()%></span>
				</h4>
				<h4>
					Author Name:<span class="text-success"><%=book.getAuthor()%></span>
				</h4>
				<h4>
					Categorie:<span class="text-success"><%=book.getBookCategory()%></span>
				</h4>
			</div>


			<div class="col-md-6 text-center p-5 border mt-4 bg-white">
				<h2 class="mb-4 mt-2"><%=book.getBookName()%></h2>


				<%
				if ("oldBook".equals(book.getBookCategory())) {
				%>
				<h2 class="text-center text-primary">Contact To Seller</h2>
				<p class="text-center text-primary">
					<i class="fas fa-envelope"><%=book.getUser_email()%></i>
				</p>

				<div class="row mb-3">
					<div class=" col-md-4 text-center text-success p-2">
						<i class="fas fa-money-bill-wave fa-3x "></i>
						<h5>CashOnDelivery</h5>
					</div>

					<div class=" col-md-4 text-center p-2 text-danger">
						<i class="fas fa-undo-alt fa-3x"></i>
						<h5>Return Available</h5>
					</div>

					<div class="col-md-4  text-center p-2 text-primary">
						<i class="fas fa-truck-moving fa-3x"> </i>
						<h5>Free Shipping</h5>
					</div>
				</div>


				<div class="text-center mt-2 p-3">
					<a href="index.jsp" class="btn btn-success text-white  btn-sm ml-4 mr-4 ">
						<i class="fas fa-cart">&nbsp;Continue Shopping</i>
					</a> <a href="" class="btn btn-secondary mr-4"> <i
						class="fas fa-rupee-sign">&nbsp;<%=book.getPrice()%></i>
					</a>
				</div>

				<%
				} else {
				%>
				<div class="row mb-3">
					<div class=" col-md-4 text-center text-success p-2">
						<i class="fas fa-money-bill-wave fa-3x "></i>
						<h5>CashOnDelivery</h5>
					</div>

					<div class=" col-md-4 text-center p-2 text-danger">
						<i class="fas fa-undo-alt fa-3x"></i>
						<h5>Return Available</h5>
					</div>

					<div class="col-md-4  text-center p-2 text-primary">
						<i class="fas fa-truck-moving fa-3x"> </i>
						<h5>Free Shipping</h5>
					</div>
				</div>


				<div class="text-center mt-2 p-3">
					<a href="" class="btn btn-danger text-white  btn-sm ml-4 mr-4 ">
						<i class="fas fa-cart">&nbsp; Add To Cart</i>
					</a> <a href="" class="btn btn-secondary mr-4"> <i
						class="fas fa-rupee-sign">&nbsp;<%=book.getPrice()%></i>
					</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>




</body>
</html>