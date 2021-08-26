
<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.NGO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/ngoHeader.jsp" >

<c:param name="title" value="Home Page"/>
</c:import>
<div class="container mtb">
	<div class="row">
		<div class="col-lg-12">
		 <br><br>
		<%
		String email=(String)session.getAttribute("email");
		NGO ngo=MainService.getNgoByName(email);
		session.setAttribute("ngo", ngo);
		%>
		
		<h1>Welcome To <%=ngo.getNgoname() %></h1>
			<br><br><br><br><br><br><br><br>
		</div>
		</div>
		</div>

<c:import url="include/footer.jsp" />