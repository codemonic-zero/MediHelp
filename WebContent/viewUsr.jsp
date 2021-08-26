
<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.User"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="View All User"></c:param>
</c:import>

<%
List<User> allUser = MainService.viewAllUser();
int sno = 1;
%>
<a href="list">List All User</a>
<div class="container mtb">
<div class="row">
<div class="col-lg-12"><br>
<h2 class="label label-primary" style="font-size:large;">View All User Details</h2>
<br><br>
<table class="table table-striped">
<thead>
<tr>
<th scope="col">Sr. No.</th>
<th scope="col">Name</th>
<!-- <th scope="col">Email</th> -->
<th scope="col">Mobile</th>
<th scope="col">Gender</th>
<th scope="col">UIDAI Aadhar</th>
<!--<th scope="col">Address</th> -->
<!-- <th scope="col">Password</th> -->
<th scope="col">Date</th>
<th scope="col">Action</th>
</tr>
</thead>

<tbody>
<c:forEach var="u" items="<%=allUser %>">
<tr>
<td><%=sno++ %></td>
<td scope="row">${u.uname}</td>
<!--<td scope="row">${usr.uemail}</td> -->
<td scope="row">${u.umobile}</td>
<td scope="row">${u.ugender}</td>
<td scope="row">${u.uid}</td>
<!--<td scope="row">${usr.uaddress}</td> -->
<!--<td scope="row">${usr.upassword}</td> -->

<td scope="row">${u.created}</td>

<td scope="row" ><a href="MainController?page=udelete&id=${u.id}" onclick="if(!(confirm('Are you sure you want to delete this record'))) return false"><i class="icofont-ui-delete"></i>
|</a><a href="showUser.jsp?id=${u.id}"><i class="icofont-eye-alt"></i></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>