<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.Donate"%>

<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="View All User"></c:param>
</c:import>

<%
List<Donate> allDonate = MainService.getDonateList();
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
<th scope="col">Donor Name</th>
<th scope="col">NGO Name</th>
<th scope="col">Medicine Name</th> 
<th scope="col">Manufacturing Company</th>
<th scope="col">Quantity</th>
<th scope="col">Manufacturing Date</th>
<th scope="col">Expiry Date</th>
<th scope="col">Price</th>
<th scope="col">Action</th>
</tr>
</thead>

<tbody>
<c:forEach var="donor" items="<%=allDonate %>">
<tr>
<td><%=sno++ %></td>
<td scope="row">${donor.dname}</td>
<td scope="row">${donor.ngo}</td>
<td scope="row">${donor.medname}</td>
<td scope="row">${donor.mfactname}</td>
<td scope="row">${donor.quantity}</td>
<td scope="row">${donor.mfactdate}</td> 
<td scope="row">${donor.expirydate}</td>
<td scope="row">${donor.price}</td>

<td scope="row" ><a href="showDonate.jsp?id=${donor.id}"><i class="icofont-eye-alt"></i></a></td>
</tr>
</c:forEach>

</tbody>
</table>
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
