<%@page import="com.entity.User"%>
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
<style>
.bg-custom1 {
	background-color: #347aeb;
}

.color-b {
	color: blue;
	font-size: xx-large;
}

.color-g {
	color: green;
	font-size: xx-large;
}

.color-y {
	color: yellow;
	font-size: xx-large;
}

.color-r {
	color: red;
	font-size: xx-large;
}

.shad {
	box-shadow: 2px 2px 4px grey;
}

.shad:hover {
	box-shadow: 4px -3px 6px black;
}

h3 {
	color: black;
}

.cbuton {
	background-color: black;
	color: white;
}

.cbuton:hover {
	color: white;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<!-- NAVBAR----------------------------------------------------------- -->

	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container">
		<c:if test="${not empty userobj }">
			<h2 class="text-center mt-4 mb-4 text-success">Hello ,
				${userobj.name }</h2>
		</c:if>
		<div class="row p-5">
			<div class="col-md-4 ">
				<a href="sellBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open text-primary fa-4x text-center"></i>
							<h3 class="card-title text-center">Sell Old Book</h3>

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 ">
				<a href="oldBookEdit.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open text-success fa-4x text-center"></i>
							<h3 class="card-title text-center">Old Book</h3>

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4 ">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-edit text-warning fa-4x text-center"></i>
							<h3 class="card-title text-center">Edit
								Profile</h3>

						</div>
					</div>
				</a>
			</div>

		</div>


		<div class="row p-5">
		

			<div class="col-md-6">
				<a href="myOrder.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-box-open text-danger fa-4x text-center"></i>
							<h3 class="card-title text-center">My Order</h3>
							<h6>Track Your Order</h6>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6">
				<a href="service.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-user-circle text-primary fa-4x text-center"></i>
							<h3 class="card-title text-center">Help Center</h3>
							<h6>24*7 Service</h6>

						</div>
					</div>
				</a>
			</div>

		</div>

	</div>
	<div style="margin-top: 100px">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>