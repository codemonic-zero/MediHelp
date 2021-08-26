<%@page import="code.med.entity.Donate"%>
<%@page import="code.med.connection.DAO"%>
<%@page import="code.med.entity.NGO"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>

<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="include/ngoHeader.jsp">
<c:param name="title" value="View All User"></c:param>
</c:import>

<%  
NGO ngo=(NGO)session.getAttribute("ngo");
String name=ngo.getNgoname();
System.out.print(name);
if(name!=null){    
try{  
  Session session2=DAO.getSfact().openSession();
  Query q=session2.createQuery("from Donate where ngo LIKE :mname");
  q.setParameter("mname","%"+name+"%");
  List<Donate> activeNgo=q.getResultList();
  
    %>
<div class="container mtb">
<div class="row">
<div class="col-lg-12">
<h2>View All User Details</h2>
<table class="table table-striped">
<thead>
<tr>
<th scope="col">Donor Name</th>
<th scope="col">Donor Email</th>
<th scope="col">Donor Mobile</th>
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
<c:forEach var="donor" items="<%=activeNgo	 %>">
<tr>
<td scope="row">${donor.dname}</td>
<td scope="row">${donor.demail}</td>
<td scope="row">${donor.dmobile}</td>
<td scope="row">${donor.medname}</td>
<td scope="row">${donor.mfactname}</td>
<td scope="row">${donor.quantity}</td>
<td scope="row">${donor.mfactdate}</td> 
<td scope="row">${donor.expirydate}</td>
<td scope="row">${donor.price}</td>

<td scope="row" ><a href="showDonate2.jsp?id=${donor.id}"><i class="icofont-eye-alt"></i></a></td>
</tr>
</c:forEach>

</tbody>
</table>
<%
}catch(Exception e){out.print(e);}  
}//end of else  
%>  
</div>
</div>
</div>

<c:import url="include/footer.jsp"></c:import>
