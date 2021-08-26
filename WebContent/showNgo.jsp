<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.NGO"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/adminHeader.jsp">
<c:param name="title" value="Change Application Status"></c:param>
</c:import>

<div class="container mt-5">
<div class="row">
<div class="col-lg-12">
<%
		
		int id=Integer.parseInt(request.getParameter("id"));
	    NGO ngo=MainService.showNgo(id);
%>
<c:set var="ngo" value="<%=ngo%>"></c:set>
<%
String msg = (String)request.getAttribute("msg");
%>
<%
if(msg!=null){
%>
<p style="color:red;"><%=msg %></p>
<%} %>
<form action="MainController?page=#" method="post">
<div class="container">
    <div class="main-body">
    
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                    <div class="mt-3">
                      <h4><%=ngo.getNgoname()%></h4>
                      <p class="text-secondary mb-1"><%=ngo.getNgoemail()%></p>
                    </div>
                  </div>
                </div>
              </div>
             
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=ngo.getNgoname()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=ngo.getNgoemail()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Address</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=ngo.getNaddress()%>
                    </div>
                  </div>
                 <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Pincode/ZipCode</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=ngo.getPincode()%>
                    </div>
                  </div>
                  <hr>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Password</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=ngo.getNgopass()%>
                    </div>
                  </div>
                </div>
              </div>
              <style type="text/css">
                body{
                    margin-top:20px;
                    color: #1a202c;
                    text-align: left;
                    background-color: #e2e8f0;    
                }
                .main-body {
                    padding: 15px;
                }
                .card {
                    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
                }
                
                .card {
                    position: relative;
                    display: flex;
                    flex-direction: column;
                    min-width: 0;
                    word-wrap: break-word;
                    background-color: #fff;
                    background-clip: border-box;
                    border: 0 solid rgba(0,0,0,.125);
                    border-radius: .25rem;
                }
                
                .card-body {
                    flex: 1 1 auto;
                    min-height: 1px;
                    padding: 1rem;
                }
                
                .gutters-sm {
                    margin-right: -8px;
                    margin-left: -8px;
                }
                
                .gutters-sm>.col, .gutters-sm>[class*=col-] {
                    padding-right: 8px;
                    padding-left: 8px;
                }
                .mb-3, .my-3 {
                    margin-bottom: 1rem!important;
                }
                
                .bg-gray-300 {
                    background-color: #e2e8f0;
                }
                .h-100 {
                    height: 100%!important;
                }
                .shadow-none {
                    box-shadow: none!important;
                }
                
                </style>
</form>
</div>
</div>
</div>

