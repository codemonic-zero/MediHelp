<%@page import="code.med.services.MainService"%>
<%@page import="code.med.entity.Donate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="include/ngoHeader.jsp">
<c:param name="title" value="Change Application Status"></c:param>
</c:import>

<div class="container mt-5">
<div class="row">
<div class="col-lg-12">
<%
		
		int id=Integer.parseInt(request.getParameter("id"));
	    Donate d=MainService.showDonate(id);
%>
<c:set var="d" value="<%=d %>"></c:set>
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
            <div class="col-md-12">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Donor Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getDname()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Donor Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getDemail()%>
                    </div>
                  </div>
                
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0"> Donor Mobile</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getDmobile()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">NGO Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getNgo()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Medicine Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getMedname()%>
                    </div>
                  </div>
                 <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Manufacturing Company</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getMfactname()%>
                    </div>
                  </div>
                  <hr>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Quantity</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getQuantity()%>
                    </div> 
                  </div>
                   <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Manufacturing Date</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getMfactdate()%>
                    </div>
                  </div>
                   <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Expiry Date</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getExpirydate()%>
                    </div>
                  </div>
                   <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Price </h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=d.getPrice()%>
                    </div>
                  </div>
             </div>
           </div>
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

