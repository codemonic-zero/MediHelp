<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/usrHeader.jsp" >

<c:param name="title" value="Home Page"/>
</c:import>
<div class="container mtb">
	<div class="row">
		<div class="col-lg-12">
		 <br><br>
		<%
		String email=(String)session.getAttribute("email");
		User u=MainService.getUserByName(email);
		session.setAttribute("u", u);
		%>
		<h1>Welcome, <%=u.getUname() %></h1>
		<br>
		<%
		String msg = (String)request.getAttribute("msg");
				if(msg!=null){
					%>
				<div class="alert alert-success" role="alert">
				  <%=msg %>
				</div>
				<%
				}
				%>	
				<br><br><br><br><br><br><br><br>
		</div>
		</div>
		</div>

<c:import url="include/footer.jsp" />