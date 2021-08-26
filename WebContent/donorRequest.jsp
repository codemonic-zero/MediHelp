
<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.User"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/usrHeader.jsp" >

<c:param name="title" value="Home Page"/>
</c:import>

<script>  
var request=new XMLHttpRequest();  
function searchInfo(){  
var name=document.vinform.name.value;  
var url="search.jsp?val="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>  

<div class="container mtb"><br>
<%
		String mail=(String)session.getAttribute("email");
		User usr=MainService.getUserByName(mail);
		session.setAttribute("u", usr);
		%>
		
		<h1>Welcome, <%=usr.getUname() %></h1>
	<div class="row">
		<div class="col-lg-12">
		<h1>Search Medicine Here..</h1>  
<form name="vinform">  
<input type="search" placeholder="Search Medicine" name="name" onkeyup="searchInfo()" >
<i ></i>
 
</form>  
  <div class="container">
<span id="mylocation"></span> 
</div> 
		</div>
		</div>
		</div>
	


<c:import url="include/footer.jsp" />