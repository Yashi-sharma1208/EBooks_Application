
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: maroon;"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<h3 class="g_color">
				<i class="fa-solid fa-book mr-2"> &nbsp;Ebook</i>
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" name="ch" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj }">
			<div class="col-md-3">
			<a href="cart.jsp" class=""><i class="fas fa-cart-plus fa-3x text-primary"></i></a>
				<a data-toggle="modal" data-target="#exampleModal"
					class=" btn btn-success text-white"><i
					class="fa-solid fa-user mr-3">&nbsp;${userobj.name } </i></a> <a
					href="logout" class="btn btn-primary"><i
					class="fa-solid fa-right-to-bracket">&nbsp; Logout</i></a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user mr-3">&nbsp; Login</i></a> <a
					href="Register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-right-to-bracket">&nbsp; Register</i></a>
			</div>

		</c:if>


	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">


	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house mr-2"> &nbsp; Home</i> </a></li>
			<li class="nav-item  active"><a class="nav-link"
				href="all_recent.jsp"><i class="fa-solid fa-book-open mr-2">&nbsp;
						Recent Book</i></a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_newBook.jsp"><i class="fa fa-book-open mr-2">&nbsp;
						New Book</i></a></li>
			<li class="nav-item  active"><a class="nav-link"
				href="all_oldBook.jsp"><i class="fa-solid fa-book-open mr-2">&nbsp;
						Old Book</i></a></li>

		</ul>


		<form class="form-inline my-2 my-lg-0">
			<a class="btn btn-light my-2  mr-2 my-sm-0" href="Setting.jsp"
				type="submit"> <i class="fa-solid fa-gear mr-3">&nbsp;
					Settings</i></a> <a class="btn btn-light my-2 my-sm-0" href="contact.jsp"
				type="submit"> <i class="fa-solid fa-address-card">&nbsp;
					Contact Us</i></a>

		</form>

	</div>

	<!-- MODAL CODE  -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">

		<div class="modal-dialog modal-dialog-centered " role="document">
			<div class="modal-content">

				<div class="modal-body">
					<h2 class="text-center text-primary">
						User:<span class="text-center text-success">${userobj.name}</span>
					</h2>
					<h5 class="text-center text-primary">
						Id:<span class="text-success">${userobj.id }</span>
					</h5>
					<h5 class="text-center text-primary">
						Email:<span class="text-success">${userobj.password }</span>
					</h5>
				</div>
				<div class="modal-footer">
					<a type="submit" href="logout" class="btn btn-success">Logout</a>
					<a  href="" type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</a>
				</div>
			</div>
		</div>
	</div>
</nav>
</body>
</html>