<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.NGO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="View All User"></c:param>
</c:import>

<%
List<NGO> allNGO = MainService.getNgoList();
int sno = 1;
%>
<div class="container mtb">
<div class="row">
<div class="col-lg-12">
<h2>View All User Details</h2>
<table class="table table-striped">
<thead>
<tr>
<th scope="col">Sr. No.</th>
<th scope="col">Name</th>
<th scope="col">Address</th> 
<th scope="col">Pincode/ZipCode</th>
<th scope="col">Action</th>
<!-- <th scope="col">Email</th> -->
<!-- <th scope="col">Password</th> -->

</tr>
</thead>

<tbody>
<c:forEach var="ngo" items="<%=allNGO %>">
<tr>
<td><%=sno++ %></td>
<td scope="row">${ngo.ngoname}</td>
<td scope="row">${ngo.naddress}</td>
<td scope="row">${ngo.pincode}</td>
<td scope="row">${ngo.created}</td>
<!--<td scope="row">${usr.uemail}</td> -->
<!--<td scope="row">${usr.upassword}</td> -->

<td scope="row" ><a href="MainController?page=ngodelete&id=${ngo.id}" onclick="if(!(confirm('Are you sure you want to delete this record'))) return false"><i class="icofont-ui-delete"></i>
|</a><a href="showNgo.jsp?id=${ngo.id}"><i class="icofont-eye-alt"></i></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>