<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success " role="alert">${succMsg}</div>
	</c:if>
	<c:remove var="succMsg" scope="session" />

	<c:if test="${not empty failMsg }">
		<div class="alert alert-danger " role="alert">${failMsg}</div>
	</c:if>
	<c:remove var="failMsg" scope="session" />

	<div class="container">
		<div class="row">
			<%
			User user = (User) session.getAttribute("userobj");
			%>
			<div class="col-md-5 offset-md-4">
				<div class="card mt-4">
					<div class="card-body">
						<h3 class="text-center text-primary">Edit Profile</h3>

						<form action="editProfile" method="get">

							<div class="form-group">
							<input type="hidden" name="id" value="${userobj.id }">
								<label for="exampleInputPassword1" class="bold">Enter
									Full Name</label> <input type="text" class="form-control"
									id="exampleInputPassword1" required name="bname"
									value="${userobj.name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" class="bold">Email
									Address </label> <input type="email" class="form-control"
									id="exampleInputEmail1" required aria-describedby="emailHelp"
									name="email" value="${userobj.email }"> <small
									id="emailHelp" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="bold">Phone
									No.</label> <input type="text" class="form-control"
									id="exampleInputPassword1" required name="number"
									value="${userobj.phno }">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="bold">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required name="password"
									value="${userobj.password }">
							</div>

							<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
					</div>

					</form>



				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 100px;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>