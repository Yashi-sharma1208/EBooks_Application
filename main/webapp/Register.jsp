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
	background-color: blue;
}
</style>
</head>
<body>

	<!-- NAVBAR----------------------------------------------------------- -->

	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center bg-custom1 text-white">

						<i class="fa-solid fa-user fa-2x"></i>
						<h5>REGISTERATION PAGE</h5>

					</div>

					<c:if test="${not empty sucMsg}">
						<h5 class="text-center text-success">${sucMsg}</h5>
						<c:remove var="sucMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failMsg}">
						<h5 class="text-center text-danger">${failMsg}</h5>
						<c:remove var="failMsg" scope="session" />
					</c:if>
					<!-- ALERT MEASSAGES __________________________________________- -->

					<div class="card-body">
						<form action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="exampleInputPassword1">Enter FullName</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email </label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									required aria-describedby="emailHelp" name="email"> <small
									id="emailHelp" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required name="password">
							</div>
							<div>
								<div class="form-group">
									<label for="exampleInputPassword1">Enter PhoneNo.</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" required name="phone">
								</div>
								<input type="checkbox" id="checkme" required name="check">
								<label for="checkme">Check Me Out</label>

							</div>
							<button type="submit"
								class="btn btn-primary btn-block badge-pill bg-custom1">Register</button>


						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- FOOTER----------------------------------------------------------- -->
	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>