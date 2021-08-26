
<%@page import="code.med.connection.DAO"%>
<%@page import="code.med.entity.Donate"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%  
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){  
out.print("<p>Please enter name!</p>");  
}else{  
try{  
  Session session2=DAO.getSfact().openSession();
  Query q=session2.createQuery("from Donate where medname LIKE :mname");
  q.setParameter("mname","%"+name+"%");
  List<Donate> listDonate=q.getResultList();
    %>
    
		
		
  <table class="table table-sm">
<thead>
<tr>
<th scope="col">ID</th>
<th scope="col">NGO Name</th>
<th scope="col">Medicine Name</th> 
<th scope="col">Manufacturing Company</th>
<th scope="col">Quantity</th>
<th scope="col">Manufacturing Date</th>
<th scope="col">Expiry Date</th>
<th scope="col">Price</th>
<th scope="col">Apply</th>
</tr>
</thead>

<tbody>
<c:forEach var="donor" items="<%=listDonate %>">
<tr>
<td scope="row">${donor.id}</td>
<td scope="row">${donor.ngo}</td>
<td scope="row">${donor.medname}</td>
<td scope="row">${donor.mfactname}</td>
<td scope="row">${donor.quantity}</td>
<td scope="row">${donor.mfactdate}</td> 
<td scope="row">${donor.expirydate}</td>
<td scope="row">${donor.price}</td>

<td scope="row" ><a href="applyRequest.jsp?id=${donor.id}">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icofont-arrow-right center"></i></a></td>
</tr>
</c:forEach>

</tbody>
</table>
    
    <%
   
 
}catch(Exception e){out.print(e);}  
}//end of else  
%>  