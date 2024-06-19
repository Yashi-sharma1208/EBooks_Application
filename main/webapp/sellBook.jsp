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

	<%
	User user = (User) session.getAttribute("userobj");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card mt-4">
					<div class="card-body">
						<h3 class="text-center text-primary">Sell Old Book</h3>
						<c:if test="${not empty succMsg }">
							<div class="alert alert-success " role="alert">${succMsg}</div>
						</c:if>
						<c:remove var="succMsg" scope="session" />

						<c:if test="${not empty failMsg }">
							<div class="alert alert-danger " role="alert">${failMsg}</div>
						</c:if>
						<c:remove var="failMsg" scope="session" />

						<form action="oldbooks" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<input type="hidden" name="user_email" value="${userobj.email}">
								<label for="exampleInputPassword1" class="bold">Book
									Name</label> <input type="text" class="form-control"
									id="exampleInputPassword1" required name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" class="bold">Author Name
								</label> <input type="text" class="form-control" id="exampleInputEmail1"
									required aria-describedby="emailHelp" name="aname"> <small
									id="emailHelp" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="bold">Price</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									required name="price">
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1" class="bold">Upload
									Photo</label> <input name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary text-center">Sell</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	<div style="margin-top: 100px;">
		<%@include file="AllComponent/footer.jsp"%>
	</div>
</body>
</html>