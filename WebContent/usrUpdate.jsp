<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.User"%>
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
		 int id=Integer.parseInt(request.getParameter("id"));
		User u=MainService.getUsr(id);
		%>
		<c:set var="u" value="u"/>
		<form action="MainController?page=updateUsr" method="post">
	<div class="form-group">
		<label for="uname" class="label label-primary" style="font-size:100%;">User ID</label>
    <input type="hidden" class="form-control" id="id" name="id" readonly="readonly" value="<%=u.getId() %>"/>
      </div>   
		<br><div class="form-group">
		<label for="uname" class="label label-primary" style="font-size:100%;">Enter Your Full Name</label>
    <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter Your Name" value="<%=u.getUname() %>"/>
      </div>    
  <div class="form-group">
  <label for="uemail" class="label label-primary" style="font-size:100%;">Email Id</label>
    <input type="email" placeholder="Enter Email" value="<%=u.getUemail() %>" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" id="uemail"  name="uemail">
    </div>
  <div class="form-group">
  <label for="umobile" class="label label-primary" style="font-size:100%;">Mobile Number</label>
    <input type="tel" placeholder="Enter Mobile" value="<%=u.getUmobile() %>" class="form-control" id="umobile" name="umobile" pattern="[7-9]{1}[0-9]{9}"/>
      </div>
    <input type="hidden" value="<%=u.getUmobile() %>" class="form-control" id="ugender" name="ugender">
 	<input type="hidden" value="<%=u.getCreated() %>" class="form-control" id="created" name="created" >
  <div class="form-group">
  <label for="uid"  class="label label-primary" style="font-size:100%;">UIDAI Aadhar</label>
    <input type="text" class="form-control" value="<%=u.getUid() %>" title="Must include (-)" id="uid" name="uid" placeholder="e.g. 0000-0000-0000" pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}">
  </div>
  <div class="form-group">
  <label for="password" class="label label-primary" style="font-size:100%;">Address</label>
  <textarea name="uaddress" placeholder="e.g. A108 Adam Street NY 535022, USA"  id="uaddress" class="form-control" rows="3" cols="8"><%=u.getUaddress() %></textarea>
  </div>
  <div class="form-group">
    <label for="password" class="label label-primary" style="font-size:100%;">Password</label>
    <!-- Minimum eight and maximum 16 characters, at least one upper case letter, one lower case letter, one number and one special character: -->

    <input type="text" value="<%=u.getUpassword()%>" title="Minimum 8 and maximum 16 characters, at least one uppercase letter, one lowercase letter, one number and one special character:"
     class="form-control" id="upassword" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$" placeholder="Enter Password" name="upassword" >
  </div>
  <button type="submit" class="btn btn-primary">Sign Up</button>
</form>	
<br>
		</div>
		</div>
		</div>

<c:import url="include/footer.jsp" /> 