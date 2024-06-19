<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin add books</title>
<%@include file="allCss.jsp"%>

<style type="text/css">
.bold {
	font-weight: 600;
}

.margin {
	margin-top: 1%;
}
</style>
</head>

<body>

	<%@include file="navbar.jsp"%>
	
	<!-- Securtiy code 

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp" />
</c:if>
-->
	<div style="background-color: #f0f2f2">
		<div class="container">
			<div class="row">
				<div class="col-md-5 offset-md-4">
					<div class="card mt-4">
						<div class="card-body">
							<h3 class="text-center text-danger">ADD BOOKS</h3>

							<!-- Alert Messages  -->
							<c:if test="${not empty succMsg}">
								<h5 class="text-center text-success">Book Added Successfully...</h5>
							</c:if>
							<c:remove var="succMsg" scope="session"/>
							
							<c:if test="${not empty failMsg }">
							<h5 class="text-center text-danger">Something Went Wrong</h5>
							</c:if>
							<c:remove var="failMsg" scope="session"/>

							<form action="../addBooks" method="post" enctype="multipart/form-data">

								<div class="form-group">
									<label for="exampleInputPassword1" class="bold">Book
										Name</label> <input type="text" class="form-control"
										id="exampleInputPassword1" required name="bname">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1" class="bold">Author
										Name </label> <input type="text" class="form-control"
										id="exampleInputEmail1" required aria-describedby="emailHelp"
										name="aname"> <small id="emailHelp"
										class="form-text text-muted"></small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" class="bold">Price</label> <input
										type="number" class="form-control" id="exampleInputPassword1"
										required name="price">
								</div>
								<div>
									<div class="form-group">
										<label for="exampleInputPassword1" class="bold">Book
											Categorie</label> <select name="btype" class="form-control">
											<option selected>--Select--</option>
											<option value="New Book">New Book</option>
											<option value="Old Book">Old Book</option>
										</select>
									</div>

									<div class="form-group">
										<label for="exampleInputPassword1" class="bold">Book
											Status</label> <select name="bstatus" class="form-control">
											<option selected>--Select--</option>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
										</select>
									</div>

									<div class="form-group">
										<label for="exampleFormControlFile1" class="bold">Upload
											Photo</label> <input name="bimg" type="file"
											class="form-control-file" id="exampleFormControlFile1">
									</div>
									<button type="submit" class="btn btn-primary">Add</button>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>
</body>
</html>