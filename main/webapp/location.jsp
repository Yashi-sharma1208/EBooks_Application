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
</head>
<body style="background-color: #f7f7f7">
	<%@include file="AllComponent/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container ">
		<div class="row p-3 text-center">
			<%
			User user = (User) session.getAttribute("userobj");
			%>
			<div class="col-md-6 offset-md-3 text-center ">
				<div class="card bg-white mt-4 text-center">
					<div class="card-body">
						<c:if test="${not empty succMsg }">
							<div class="alert alert-success " role="alert">${succMsg}</div>
						</c:if>
						<c:remove var="succMsg" scope="session" />

						<c:if test="${not empty failMsg }">
							<div class="alert alert-danger " role="alert">${failMsg}</div>
						</c:if>
						<c:remove var="failMsg" scope="session" />

						<h2 class="text-center text-success mt-3">Your Address</h2>
						<form action="location" method="post">
							<div class="form-row mt-3">
								<div class="form-group col-md-6">
									<input type="hidden" name="id" value="${userobj.id }">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4" name="address">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" name="land">
								</div>
							</div>

							<div class="form-row mt-3">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" name="city">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">Zip</label> <input type="text"
										class="form-control" id="inputEmail4" name="zip">
								</div>
							</div>
							<div class="form-group">
								<a href="" type="submit" class="btn btn-warning">Add Address</a>
							</div>
						</form>

					</div>

				</div>

			</div>

		</div>
	</div>
	<div style="margin-top: 180px;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>