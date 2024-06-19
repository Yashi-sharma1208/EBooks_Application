<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.Dao.CartDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.Dao.CardDaoImp"%>
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
<body style="background-color: #f0f1f2;">
	<%@include file="AllComponent/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center " role="alert">${succMsg}</div>
	</c:if>
	<c:remove var="succMsg" scope="session" />

	<c:if test="${not empty failMsg }">
		<div class="alert alert-danger text-center" role="alert">${failMsg}</div>
	</c:if>
	<c:remove var="failMsg" scope="session" />
	<%
	User user = (User) session.getAttribute("userobj");
	%>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6 mt-4">
				<div class="card bg-white mt-4 ml-3">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table">
							<thead>
								<tr>

									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>
								<%
								int id = user.getId();
								%>
								<%
								CartDao cd = new CardDaoImp(DBConnect.getConnection());
								List<Cart> list = cd.getCartbyId(id);
								double tprice = 0.0;
								for (Cart c : list) {
									tprice = c.getTotalprice();
								%>
								<tr>
									<th scope="row"><%=c.getBook_name()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&oid=<%=c.getOid() %>"
										class="btn btn-danger text-white">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td class="text-success"><h4>Total Price</h4></td>
									<td></td>
									<td></td>
									<td class="text-danger"><h5><%=tprice%></h5></td>
								</tr>
							</tbody>

						</table>
					</div>
				</div>

			</div>

			<div class="col-md-6 text-center ">
				<div class="card bg-white mt-4 ml-3">
					<div class="card-body">
						<h2 class="text-center text-success">Your Details For Order</h2>
						<form action="orderServlet" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
								<input type="hidden" name="id" value="<%=user.getId()%>">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" required id="inputEmail4" name="name" value="<%=user.getName()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" required  id="inputPassword4" name="email" value="<%=user.getEmail()%>">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile No</label> <input type="text"
										class="form-control" required id="inputEmail4" name="mobile" value="<%=user.getPhno()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" required name="add" id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" required  name="land" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" required name="city" id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" required name="state" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" required name="zip" id="inputPassword4">
								</div>
							</div>
							<div class="form-group col-md-12">
								<label for="inputState">Payment Type</label> <select
									id="inputState" class="form-control" name="pay">
									<option value="noselect">Choose...</option>
									<option value="cod">Cash On delivery</option>
									<option value="upi">UPI</option>
									<option value="paytm">Paytm</option>
								</select>
							</div>


							<div class="form-group">
								<button type="submit" class="btn btn-warning">Order Now</button> <a
									href="index.jsp" type="submit" class="btn btn-success">Continue
									Shopping</a>
									</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>      