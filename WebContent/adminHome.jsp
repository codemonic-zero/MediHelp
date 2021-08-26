<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="include/adminHeader.jsp" >

<c:param name="title" value="Home Page"/>
</c:import>
<div class="container mtb">
	<div class="row">
	
		<div class="col-lg-12"><br/>
	 <br><br>
		<%
				String email=(String)session.getAttribute("email");
				if(email!=null){
				%>
				 <div class="alert alert-success" role="alert">
				 				Welcome, <%=email %> </div>
				<%
				}
		%>
		<br><br><br><br><br><br><br><br>
		</div>
		</div>
		</div>

<c:import url="include/footer.jsp" />