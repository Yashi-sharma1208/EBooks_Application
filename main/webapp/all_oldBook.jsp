<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.entity.Book"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.admin.servlet.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
<h2 class="text-center text-success">OLD BOOKS</h2>

<c:if test="${not empty addCart}">
	<h5 class="text-center  text-success">${addCart }</h5>
	</c:if>
	<c:remove var="addCart" scope="session"/>

	<c:if test="${not empty notadd}">
	<h5 class="text-center  text-danger">${notadd }</h5>
	</c:if>
	<c:remove var="notadd" scope="session"/>

	<!--  start old Book-->

	<div class="container">
		
		<!-- Main card _______________________________ -->
		<div class="row">
			<%
			BookDaoImp bd2 = new BookDaoImp(DBConnect.getConnection());
			List<Book> list2 = bd2.getOldBook();
			for (Book b : list2) {
			%>
			<div class="col-md-3">
			
				<!-- single card body 1 -->
				<div class="card car-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="AllComponent/imgs/<%=b.getPhotoName()%>"
							style="width: 200px; height: 200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categorie:<%=b.getBookCategory()%></p>
						<div class="row text-center">
							<a href="viewBook.jsp?id=<%=b.getBookId()%>" class="btn btn-success  btn-sm mr-3 ml-4">View</a> <a
								href="" class="btn btn-secondary my-2  mr-2 my-sm-0  borde"> <i
								class="fas fa-rupee-sign"><%=b.getPrice()%></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>


</body>
</html>