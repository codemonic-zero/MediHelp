  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/homeHeader.jsp">
<c:param name="title" value="Registration"/>
</c:import>
<div style="background-color:info">
<div class="container mtb">
	<div class="row">
	<div class="col-lg-4" >
		</div>
		<div class="col-lg-4" ><br>

		  <form action="MainController?page=forgetPass" method="post">
		   <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">User Type</label>
		  </div>
		  <select class="custom-select" id="type" name="type">
		    <option selected value="user" class="label label-primary" style="font-size: small;">USER</option>
		    <option value="ngo" class="label label-primary" style="font-size: small;">NGO</option>
		  </select>
		</div>
		  <div class="form-group">
  			<label for="uemail" class="label label-primary" style="font-size: 100%;">E-mail Id</label>
    			<input type="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" id="uemail" placeholder="Enter Email" name="email" required="required">
   		  </div>
   		  <div class="form-group">
		    <label for="newpass" class="label label-primary" style="font-size: 100%;">New Password</label>
		    <input type="password" title="Minimum 8 and maximum 16 characters, at least one uppercase letter, one lowercase letter, one number and one special character:"
		     class="form-control" id="newpass" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" placeholder="New Password" name="newpass" >
		  </div>
	
	 <!-- <div class="form-group">
		    <label for="password" class="label label-primary" style="font-size: 100%;">Confirm New Password</label>
		    <input type="password" title="Minimum 8 and maximum 16 characters, at least one uppercase letter, one lowercase letter, one number and one special character:"
		     class="form-control" id="cnewpass" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" placeholder="Confirm New Password" name="cnewpass" onblur="checkStat()">
		  </div>
 		 -->
		<button type="submit" class="btn btn-info btn-lg btn-block" >Change Password</button>
		</form>
		 <br>
		 <br>	
		</div>
		</div>
		</div>
		</div>
		
<c:import url="include/footer.jsp" /> 