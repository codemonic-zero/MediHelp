  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/homeHeader.jsp" >

<c:param name="title" value="Registration"/>
</c:import>
<script>
</script>
<div style="background-color:info">
<div class="container mtb">
	<div class="row">
	<div class="col-lg-4" >
		</div>
		<div class="col-lg-4" ><br>
		
		<%
				String msg = (String)request.getAttribute("msg");
				if(msg!=null){
				%>
				<div class="alert alert-success" role="alert">
				  <%=msg %>
				</div>
				<%
				}
		%>
		<form action="MainController?page=login" method="post">

		  <div class="form-group">
		  
  			<label for="uemail" class="label label-primary" style="font-size: 100%;">E-mail Id</label>
    			<input type="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" id="uemail" placeholder="Enter Email" name="email" required="required">
   		  		
   		  </div>
   		  <div class="form-group">
		    <label for="password" class="label label-primary" style="font-size: 100%;">Password</label>
		    <input type="password" title="Minimum 8 and maximum 16 characters, at least one uppercase letter, one lowercase letter, one number and one special character:"
		     class="form-control" id="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" placeholder="Enter Password" name="password" >
		  </div>
 		 <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">User Type</label>
		  </div>
		  <select class="custom-select" id="type" name="type">
		    <option selected value="admin" class="label label-primary" style="font-size: small;">ADMIN</option>
		    <option value="user" class="label label-primary" style="font-size: small;">USER</option>
		    <option value="ngo" class="label label-primary" style="font-size: small;">NGO</option>
		  </select>
</div>
		<button type="submit" class="btn btn-info btn-lg btn-block">Login</button>
			 <p class="btn-block"><a href="forgetpass.jsp" class="btn btn-link btn-lg btn-block">Forget Password!</a>
			 <a href="usrReg.jsp" class="btn btn-success btn-lg btn-block">Create a user account</a>
			 
		</form>
		 <br>
		 <br>	
		</div>
		</div>
		</div>
		</div>
		
<c:import url="include/footer.jsp" /> 