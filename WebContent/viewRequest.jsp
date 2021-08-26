
<%@page import="code.med.entity.RequestData"%>
<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.NGO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="include/ngoHeader.jsp">
<c:param name="title" value="View All User"></c:param>
</c:import>
<%
		String email=(String)session.getAttribute("email");
		NGO ngo=MainService.getNgoByName(email);
		session.setAttribute("ngo", ngo);
		%>
		
		<h1>Welcome To <%=ngo.getNgoname() %></h1>
		<br><br>
<%
List<RequestData> requestdata = MainService.getAllRequest(ngo.getNgoname());

int sno = 1;

%>
<div class="container mtb">
<div class="row">
<div class="col-lg-12">
<h2>View All User Details</h2>
<table class="table table-striped">
<thead>
<tr>
<th scope="col">Requester Name</th>
<th scope="col">Requester Email</th>
<th scope="col">Requester Mobile</th> 
<th scope="col">Medicine Name</th>
<th scope="col">Manufacturing Company</th>
<th scope="col">Manufacturing Date</th>
<th scope="col">Expiry Date</th>
<!-- <th scope="col">Status</th> -->
<!-- <th scope="col"> Change Status</th> -->
</tr>
</thead>

<tbody>
<c:forEach var="rd" items="<%=requestdata %>">
<tr>
<td scope="row">${rd.rname}</td>
<td scope="row">${rd.remail}</td>
<td scope="row">${rd.rmobile}</td>
<td scope="row">${rd.rmedname}</td>
<td scope="row">${rd.rmfactname}</td>
<td scope="row">${rd.rmfactdate}</td> 
<td scope="row">${rd.rexpirydate}</td>
<!-- <td scope="row">We Will Contact you Soon</td> -->

<%-- <td scope="row" ><a href="changeStatus.jsp?id=${rd.id}"><i class="icofont-eye-alt"></i></a></td> --%>
</tr>
</c:forEach>

</tbody>
</table>
<br><br>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
