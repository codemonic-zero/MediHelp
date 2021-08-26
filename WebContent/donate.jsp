<%@page import="code.med.entity.User"%>
<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.NGO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/usrHeader.jsp" >

<c:param name="title" value="Home Page"/>
</c:import>

<%
 List<NGO> listngo=MainService.getNgoList();
	System.out.print(listngo);
%>

		
		<div class="container mtb"><br>
		<%
		String mail=(String)session.getAttribute("email");
		User usr=MainService.getUserByName(mail);
		session.setAttribute("u", usr);
		%>
		
		<h1>Welcome, <%=usr.getUname() %></h1>
	<div class="row">
	
	<div class="col-lg-4" >
	</div>
		<div class="col-lg-5" >
		<%
		String email=(String)session.getAttribute("email");
	    User u=MainService.showDoner(email);
%>
<c:set var="u" value="<%=u %>"></c:set>
		<form action="MainController?page=donate" method="post" >
		<br>
		 <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">NGO Name</label>
		  </div>
		  <select class="custom-select" id="ngo" name="ngo">
		    <c:forEach items="<%=listngo %>" var="ngo1">
		    <option value="${ngo1.ngoname}">${ngo1.ngoname}	</option>
		    
		    </c:forEach>
		  </select>
	</div>
	<div class="form-group">
    <input type="hidden" class="form-control" value="<%=u.getUname()%>" id="dname"  name="dname">
    </div>
    <div class="form-group">
    <input type="hidden" class="form-control" value="<%=u.getUemail()%>" id="demail"  name="demail">
    </div>
    <div class="form-group">
    <input type="hidden" class="form-control" value="<%=u.getUmobile()%>" id="dmobile"  name="dmobile">
    </div>
    <div class="form-group">
    <label for="medname">Medicine Name</label>
    <input type="text" class="form-control" placeholder="Enter Medicine Name" id="medname"  name="medname">
    </div>
    <div class="form-group">
    <label for="mfactname">Manufacturer Name</label>
    <input type="text" class="form-control" placeholder="Enter Manufacturer Name" id="mfactname"  name="mfactname">
    </div>
    <div class="form-group">
    <label for="quantity">Quantity</label>
    <input type="text" class="form-control" placeholder="Quatity in nos." id="quantity"  name="quantity">
    </div>
    <div class="form-group">
    <label for="mfactdate">Manufacturing Date</label>
    <input type="date" class="form-control" id="mfactdate"  name="mfactdate">
    </div>
    <div class="form-group">
    <label for="expirydate">Expiry Date</label>
    <input type="date" class="form-control" name="expirydate" id="expirydate">
    </div>
    <div class="form-group">
    <label for="price">Price</label>
    <input type="text" class="form-control" placeholder="Enter Price" id="price"  name="price">
    </div>
    
  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<br>
		</div>
		</div>
		</div>
<c:import url="include/footer.jsp" />