
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
			<form class="form-inline my-2 my-lg-0">
				
			</form>
		</div>
		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				<a class="btn btn-success my-2  ml-10 my-sm-0 text-white" href="" type="submit"><i
					class="fa-solid fa-right-to-bracket">&nbsp; ${userobj.name}</i></a>
					<a class="btn btn-primary my-2  ml-10 my-sm-0" data-toggle="modal" data-target="#exampleModalLong" type="submit"><i
					class="fa-solid fa-right-to-bracket">&nbsp; Logout</i></a>
			</c:if>
			<c:if test="${empty userobj }">

				<a href="../login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user mr-3">&nbsp; Login</i></a>
				<a href="../Register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-right-to-bracket">&nbsp; Register</i></a>
			</c:if>
		</div>
	</div>
</div>

<!-- logout modal start  -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title text-danger" id="exampleModalLongTitle"></h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
       <h3>Do You Want To Logout</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>


<!--  logout modal ends  -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">


	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa-solid fa-house mr-2"> &nbsp; Home</i> </a></li>

		</ul>


	</div>
</nav>
</body>
</html>