  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/homeHeader.jsp" >

<c:param name="title" value="Registration"/>
</c:import>
<div class="container mtb">
	<div class="row">
	<div class="col-lg-4" >
		</div>
		<div class="col-lg-5" >
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
		<form action="MainController?page=usrRegorUpdate" method="post">
		
		<br><div class="form-group">
		<label for="uname" class="label label-primary" style="font-size:100%;">Enter Your Full Name</label>
    <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter Your Name"/>
      </div>    
  <div class="form-group">
  <label for="uemail" class="label label-primary" style="font-size:100%;">Email Id</label>
    <input type="email" placeholder="Enter Email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" id="uemail"  name="uemail">
    </div>
  <div class="form-group">
  <label for="umobile" class="label label-primary" style="font-size:100%;">Mobile Number</label>
    <input type="tel" placeholder="Enter Mobile" class="form-control" id="umobile" name="umobile" pattern="[7-9]{1}[0-9]{9}"/>
      </div>
   <label for="Gender" class="label label-primary" style="font-size:100%;">Gender</label><br><br>
  <div class="form-check form-check-inline">
  <input type="radio" class="form-check-input" id="ugender" name="ugender" value="Male"/><label class="form-check-label">Male&nbsp;</label>
  <input type="radio" class="form-check-input" id="ugender" name="ugender" value="Female"><label class="form-check-label">Female&nbsp;</label>
  <input type="radio" class="form-check-input" id="ugender" name="ugender" value="other"><label class="form-check-label">Other&nbsp;</label>
 </div>
  <br><br>
  <div class="form-group">
  <label for="uid"  class="label label-primary" style="font-size:100%;">UIDAI Aadhar</label>
    <input type="text" class="form-control" title="Must include (-)" id="uid" name="uid" placeholder="e.g. 0000-0000-0000" pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}">
  </div>
  <div class="form-group">
  <label for="password" class="label label-primary" style="font-size:100%;">Address</label>
  <textarea name="uaddress" placeholder="e.g. A108 Adam Street NY 535022, USA" id="uaddress" class="form-control" rows="3" cols="8"></textarea>
  </div>
  <div class="form-group">
    <label for="password" class="label label-primary" style="font-size:100%;">Password</label>
    <!-- Minimum eight and maximum 16 characters, at least one upper case letter, one lower case letter, one number and one special character: -->

    <input type="password" title="Minimum 8 and maximum 16 characters, at least one uppercase letter, one lowercase letter, one number and one special character:"
     class="form-control" id="upassword" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" placeholder="Enter Password" name="upassword" >
  </div>
  <button type="submit" class="btn btn-primary">Sign Up</button>
</form>	
<br>
		</div>
		</div>
		</div>

<c:import url="include/footer.jsp" /> 