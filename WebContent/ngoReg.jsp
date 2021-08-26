  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/adminHeader.jsp" >

<c:param name="title" value="NGO Reg"/>
</c:import>

<div class="container mtb">
	<div class="row">
	<div class="col-lg-4" >
	</div>
		<div class="col-lg-4" >
		<form action="MainController?page=ngoreg" method="post">
		<br><div class="form-group">
		<label for="uname" class="label label-primary" style="font-size:100%;">NGO</label>
    <input type="text" class="form-control" id="ngoname" name="ngoname" placeholder="Enter NGO Name"/>
      </div>    
  <div class="form-group">
  <label for="uemail" class="label label-primary" style="font-size:100%;">Email Id</label>
    <input type="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Enter Email" id="ngoemail"  name="ngoemail">
    </div>
    <div class="form-group">
    <label for="password" class="label label-primary" style="font-size:100%;">Password</label>
	<input type="password" title="Minimum eight and maximum 16 characters, at least one uppercase letter, one lowercase letter, one number and one special character:"
     class="form-control" id="ngopass" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" placeholder="Enter Password" name="ngopass" >
  </div>
  <div class="form-group">
  <label for="naddress" class="label label-primary" style="font-size:100%;">Address</label>
  <textarea name="naddress" placeholder="e.g. A108 Adam Street NY 535022, USA" id="naddress" class="form-control" rows="3" cols="8"></textarea>
  </div>
  <div class="form-group">
  <label for="pincode" class="label label-primary" style="font-size:100%;">Pincode/Zip Code</label>
  <input type="text" class="form-control" id="pincode" name="pincode" placeholder="e.g. 110011"/>
  </div>
  
  <button type="submit" class="btn btn-primary">Sign Up</button>
		</form>	
<br>
		</div>
		</div>
		</div>

<c:import url="include/footer.jsp" /> 