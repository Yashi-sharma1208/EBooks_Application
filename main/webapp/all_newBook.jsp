<%@page import="com.entity.User"%>
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
<style type="text/css">
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>

	<%@include file="AllComponent/navbar.jsp"%>

	<h2 class="text-center text-danger">NEW BOOKS</h2>
	<!--  start New Book-->
	<c:if test="${not empty addCart }">
		<div id="toast">${addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	</c:if>

	<c:if test="${not empty addCart}">
		<h5 class="text-center  text-success">${addCart }</h5>
	</c:if>
	<c:remove var="addCart" scope="session" />

	<c:if test="${not empty notadd}">
		<h5 class="text-center  text-danger">${notadd }</h5>
	</c:if>
	<c:remove var="notadd" scope="session" />


	<div class="container">

		<!-- Main card _______________________________ -->
		<div class="row">
			<%
			User user = (User) session.getAttribute("userobj");
			%>
			<%
			BookDaoImp bd = new BookDaoImp(DBConnect.getConnection());
			List<Book> list = bd.getNewBook();
			for (Book b : list) {
			%>
			<div class="col-md-3">
				<!-- single card body 1 -->
				<div class="card car-ho mr-4 mt-3">
					<div class="card-body text-center">
						<img alt="" src="AllComponent/imgs/<%=b.getPhotoName()%>"
							style="width: 200px; height: 200px">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categorie:<%=b.getBookCategory()%></p>
						<div class="row text-center">
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger  btn-sm mr-3 ml-3">Add</a>
							<%
							} else {
							%>
							<a
								href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger  btn-sm mr-3 ml-3">Add</a>
							<%
							}
							%><a href="viewBook.jsp?id=<%=b.getBookId()%>" class="btn btn-success  btn-sm mr-1">View</a> <a
								href="" class="btn btn-secondary my-2  my-sm-0  borde"> <i
								class="fas fa-rupee-sign"><%=b.getPrice()%></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
	</div>


</body>
</html>