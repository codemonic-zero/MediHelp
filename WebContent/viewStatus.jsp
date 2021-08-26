
<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.User"%>
<%@page import="code.med.entity.Donate"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/usrHeader.jsp" >

<c:param name="title" value="Registration"/>
</c:import>

<div class="container mtb"><br>
<%
		 int id=Integer.parseInt(request.getParameter("id"));
		
		Donate d=MainService.getRequest(id);
		
		String mail=(String)session.getAttribute("email");
		User u=MainService.getUserByName(mail);
		session.setAttribute("u", u);
		%>
		<h1>Welcome, <%=u.getUname() %></h1>
	<div class="row">
	<div class="col-lg-4" >
		</div>
		<div class="col-lg-4" >
		
		<c:set var="u" value="u"/>
		<form action="MainController?page=getAllRequest" method="post" enctype="multipart/form-data">   
		<br><div class="form-group">
		<label for="uname" class="label label-primary" style="font-size:100%;">Enter Your Full Name</label>
    <input type="text" class="form-control" id="rname" name="rname" readonly="readonly" value="<%=u.getUname()%>"/>
      </div>    
  <div class="form-group">
  <label for="uemail" class="label label-primary" style="font-size:100%;">Email Id</label>
    <input type="email" value="<%=u.getUemail() %>" class="form-control" readonly="readonly" id="remail"  name="remail">
    </div>
  <div class="form-group">
  <label for="umobile" class="label label-primary" style="font-size:100%;">Mobile Number</label>
    <input type="tel" value="<%=u.getUmobile() %>" class="form-control" id="rmobile" name="rmobile" readonly="readonly"/>
      </div>
      <div class="form-group">
  <label for="umobile" class="label label-primary" style="font-size:100%;">NGO Name</label>
    <input type="tel" readonly="readonly" value="<%=d.getNgo() %>" class="form-control" id="rngo" name="rngo"/>
      </div>
    <div class="form-group">
    <label for="uname" class="label label-primary" style="font-size:100%;">Medicine Name</label>
    <input type="text" class="form-control" readonly="readonly" value="<%=d.getMedname() %>"  id="rmedname"  name="rmedname">
    </div>
    <div class="form-group">
    <label for="uname" class="label label-primary" style="font-size:100%;">Manufacturer Name</label>
    <input type="text" class="form-control" readonly="readonly" value="<%=d.getMfactname() %>"  id="rmfactname"  name="rmfactname">
    </div>
    <div class="form-group">
    <label for="uname" class="label label-primary" style="font-size:100%;">Manufacturing Date</label>
    <input type="text" readonly="readonly" class="form-control" value="<%=d.getMfactdate() %>"  id="rmfactdate"  name="mfactdate">
    </div>
    <div class="form-group">
    <label for="uname" class="label label-primary" style="font-size:100%;">Expiry Date</label>
    <input type="text" readonly="readonly" class="form-control" value="<%=d.getExpirydate() %>"  name="rexpirydate" id="rexpirydate">
    </div> 
    <div class="form-group">
    <input type="text" readonly="readonly" class="form-control" value="In Process" name="status" id="status">
    </div> 
  <button type="submit" class="btn btn-primary">Request</button>
</form>	
<br>
		</div>
		</div>
		</div>

<c:import url="include/footer.jsp" /> 