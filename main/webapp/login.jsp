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

.margin {
	margin-top: 6%;
	margin-bottom: 6%;
}
</style>
</head>
<body>
	<!-- NAVBAR----------------------------------------------------------- -->

	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container margin">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
				<div class="card ">
					<div class="card-header text-center bg-custom1 text-white">
						<!-- <i class='far fa-id-badge' style='font-size:36px'></i>-->
						<i class="fa-solid fa-user fa-2x"></i>

						<h5>LOGIN PAGE</h5>
					</div>

					<!-- here we can write any html code  -->
					<!-- ALERT MESSAGES  -->
				<c:if test="${not empty succMsg}">
						<h5 class="text-center text-success">${succMsg}</h5>
						<c:remove var="succMsg" scope="session" />
					</c:if>
					
					
					<c:if test="${not empty failedMsg}">
						<h5 class="text-center text-danger">${failedMsg}</h5>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

					<div class="card-body">
						<form action="login_servlet" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email </label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									required aria-describedby="emailHelp" name="email"> <small
									id="emailHelp" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required placeholder="Password" name="password">
							</div>
							<div>
								<input type="checkbox" id="checkme" required name="check">
								<label for="checkme">Check Me Out</label>

							</div>
							<div class="text-center block">
								<button type="submit" class="btn btn-primary  bg-custom1">Login</button>

							</div>
							<div class="text-center">
								<a href="Register.jsp">Create Account</a>

							</div>
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