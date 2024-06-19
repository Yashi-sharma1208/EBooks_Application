<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN:HOME</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
.color-b {
	color: blue;
	box-shadow: 4px -4px 6px grey;
}

.color-r {
	color: red;
	box-shadow: 4px -4px 6px grey;
}

.color-y {
	color: yellow;
	box-shadow: 4px -4px 6px grey;
}

.margin {
	margin-top: 13%;
}

.shadow {
	box-shadow: 4px -4px 6px grey;
}

h4 {
	color: black;
	font-weight: 700;
}

.color-m {
	color: maroon;
	font-size: xx-large;
}

a:hover {
	text-decoration: none;
	color: black;
}

h2 {
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

<!-- Securtiy code  -->

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp" />
</c:if>



	<div class="container">

		<div class="mt-5 mb-5"></div>
		<div class="row">
			<div class="col-md-3">
				<a href="addBooks.jsp">
					<div class="card mt-5 mr-2 text-center shadow"
						style="width: 15rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus color-b fa-3x"></i>
							<h4 class="mt-2">Add Book</h4>
							<h2>---------</h2>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="allBooks.jsp">

					<div class="card mt-5 mr-2 text-center shadow"
						style="width: 15rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open color-r fa-3x"></i>
							<h4 class="mt-2">All Books</h4>
							<h2>---------</h2>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orderBooks.jsp">
					<div class="card mt-5 mr-2 text-center shadow"
						style="width: 15rem;">
						<div class="card-body text-center">
							<i class="fa-solid fa-cart-shopping fa-3x color-y"></i>
							<h4 class="mt-2">Order Book</h4>
							<h2>---------</h2>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalLong">
					<div class="card mt-5 mr-2 text-center shadow"
						style="width: 15rem;">
						<div class="card-body text-center">

							<i class="fa-solid fa-arrow-right-from-bracket fa-3x color-b"></i>
							<h4 class="mt-2">Logout</h4>
							<h2>---------</h2>
						</div>
				</div>
				</a>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModalLong" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title text-danger" id="exampleModalLongTitle"></h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h3>Do You Want To Logout</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../logout" type="button" class="btn btn-primary">Logout</a>
				</div>
			</div>
		</div>
	</div>



	<div style="margin-top: 340px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>