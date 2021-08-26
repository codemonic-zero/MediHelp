package code.med.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import code.med.entity.Donate;
import code.med.entity.Login;
import code.med.entity.NGO;
import code.med.entity.RequestData;
import code.med.entity.User;
import code.med.services.MainService;


@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action=request.getParameter("page");
		switch(action) {
		case "usrRegorUpdate":
			usrRegorUpdate(request,response);
			break;
		case "udelete":
			userDelete(request,response);
		case "ngoreg":
			ngoReg(request,response);
			break;
		case "login":
			allLogin(request,response);
			break;
		case "donate":
			donationData(request,response);
			break;
		case "ngodelete":
			ngoDelete(request,response);
			break;			
		case "allLogout":
			allLogout(request,response);
			break;
		case "forgetPass":
			forgetPass(request,response);
			break;
		case "updateUsr":
			updateUsr(request,response);
			break;
		case "getAllRequest":
			getAllRequest(request,response);
			break;
			default:
				break;
		}
	}

	

	/* User Data*/
	//Delete
	private void userDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = new User();
		u.setId(Integer.parseInt(request.getParameter("id")));
		boolean status = MainService.userDelete(u);
		if(status)
		{
			request.getRequestDispatcher("viewUsr.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("viewUsr.jsp").forward(request, response);
		}
		
	}
	//Registration or Update
	private void usrRegorUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		Login login=new Login();
		login.setEmail(request.getParameter("uemail"));
		login.setPassword(request.getParameter("upassword"));
		login.setType("user");
		
		User usr=new User();
		usr.setUname(request.getParameter("uname"));
		usr.setUemail(request.getParameter("uemail"));
		usr.setUmobile(request.getParameter("umobile"));
		usr.setUgender(request.getParameter("ugender"));
		usr.setUid(request.getParameter("uid"));
		usr.setUaddress(request.getParameter("uaddress"));
		usr.setUpassword(request.getParameter("upassword"));
		
		
		
		boolean status = MainService.saveorUpdateUser(usr);
		if(status)
		{
			MainService.saveLoginData(login);
			request.setAttribute("msg", "Registration is Successful... <br> Please login to continue");
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
		else
		{
			request.setAttribute("msg","Email or Mobile Number is already Registered with us....");
			request.getRequestDispatcher("usrReg.jsp").include(request, response);
		}
		
	}

	//Forget Password
	private void forgetPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*
		 * new Login(); new User(); new NGO();
		 */
		
		String email = request.getParameter("email");
		String pass=request.getParameter("newpass");
		String type=request.getParameter("type");
		/*
		 * System.out.println(email); System.out.println(pass);
		 * System.out.println(type);
		 */
		
		Login login=MainService.loginType(email,pass,type);
		boolean status= MainService.forgetPass(email,pass,type);
		//status = login.isLogin();
	
		if(status)
		{
			request.setAttribute("msg", "Password Updated Successfully..");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			/*
			 * if(type.equals("user")) {
			 * 
			 * session.setAttribute("email", email); request.setAttribute("msg",
			 * "Password Updated Successfully..");
			 * //request.getRequestDispatcher("login.jsp").forward(request, response); }else
			 * if(type.equals("ngo")) {
			 * 
			 * session.setAttribute("email", email); request.setAttribute("msg",
			 * "Password Updated Successfully..");
			 * //request.getRequestDispatcher("login.jsp").forward(request, response); }
			 * else { request.setAttribute("msg",
			 * "Entered Email doesn't Registered with us..");
			 * //request.getRequestDispatcher("login.jsp").forward(request, response); }
			 */
	}
		else {
			request.setAttribute("msg", "Entered Email doesn't Registered with us..");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
}
	//Update
private void updateUsr(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User usr=new User();
		usr.setId(Integer.parseInt(request.getParameter("id")));
		usr.setUname(request.getParameter("uname"));
		usr.setUemail(request.getParameter("uemail"));
		usr.setUmobile(request.getParameter("umobile"));
		usr.setUgender(request.getParameter("ugender"));
		usr.setUid(request.getParameter("uid"));
		usr.setUaddress(request.getParameter("uaddress"));
		usr.setUpassword(request.getParameter("upassword"));
		MainService.updateUser(usr);
		
		boolean status = MainService.updateUser(usr);
		if(status)
		{
			request.setAttribute("msg", "Data Sucessfully Fetched..");
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
		else
		{
			request.getRequestDispatcher("usrUpdate.jsp").include(request, response);
		}
	}

//getAllRequest
		private void getAllRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			RequestData rd=new RequestData();
			rd.setFilname(request.getParameter("F1"));
			rd.setRngo(request.getParameter("rngo"));
			rd.setRname(request.getParameter("rname"));
			rd.setRemail(request.getParameter("remail"));
			rd.setRmobile(request.getParameter("rmobile"));
			rd.setRmedname(request.getParameter("rmedname"));
			rd.setRmfactname(request.getParameter("rmfactname"));
			rd.setRmfactdate(request.getParameter("rmfactdate"));
			rd.setRexpirydate(request.getParameter("rexpirydate"));
			rd.setStatus(request.getParameter("status"));
			
		      String fileName= request.getParameter("F1");
		      ServletFileUpload upload=new ServletFileUpload(new DiskFileItemFactory());
				
				try {
					List<FileItem> images=upload.parseRequest(request);
					for (FileItem image : images) {
						
						String name=image.getName();
						name=name.substring(name.lastIndexOf("\\")+1);
						File f=new File("C:/cloud/"+fileName);
						image.write(f);
						System.out.println(name);
						
					}
				} catch (Exception e) {
					
					e.printStackTrace();
				}
			
			boolean status = MainService.requestData(rd);
			
			if(status)
			{
				System.out.println("My Status "+status);
				
				request.setAttribute("msg", "Data Sucessfully Saved..");
				request.getRequestDispatcher("userHome.jsp").include(request, response);
			}
			else
			{
				request.setAttribute("msg", "Data Not Saved..");
				request.getRequestDispatcher("userHome.jsp").include(request, response);
			}
			
	}	
		
	
/*Donation Data*/
	
	//Save
	private void donationData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Donate donate=new Donate();
		donate.setDname(request.getParameter("dname"));
		donate.setDemail(request.getParameter("demail"));
		donate.setDmobile(request.getParameter("dmobile"));
		donate.setNgo(request.getParameter("ngo"));
		donate.setMedname(request.getParameter("medname"));
		donate.setMfactname(request.getParameter("mfactname"));
		donate.setQuantity(request.getParameter("quantity"));
		donate.setMfactdate(request.getParameter("mfactdate"));
		donate.setExpirydate(request.getParameter("expirydate"));
		donate.setPrice(request.getParameter("price"));
		
		boolean status = MainService.saveDonatedata(donate);
		if(status)
		{
			request.setAttribute("msg", "Donation Completed Sucessfully...");
			request.getRequestDispatcher("userHome.jsp").include(request, response);
		}
		else
		{
			request.setAttribute("msg", "Error!<br> Try after some time...");
			request.getRequestDispatcher("ngoReg.jsp").include(request, response);
		}
	}
/*NGO Data*/
	
	//NGO Registration
	private void ngoReg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NGO ngo=new NGO();
		ngo.setNgoname(request.getParameter("ngoname"));
		ngo.setNgoemail(request.getParameter("ngoemail"));
		ngo.setNgopass(request.getParameter("ngopass"));
		ngo.setNaddress(request.getParameter("naddress"));
		ngo.setPincode(request.getParameter("pincode"));
		ngo.setType("ngo");
		
		Login login=new Login();
		login.setEmail(request.getParameter("ngoemail"));
		login.setPassword(request.getParameter("ngopass"));
		login.setType("ngo");
		
		boolean status = MainService.saveNgoReg(ngo);
		if(status)
		{
			MainService.saveLoginData(login);
			request.setAttribute("msg","Registration Successful");
			request.getRequestDispatcher("adminHome.jsp").include(request, response);
		}
		else
		{
			request.setAttribute("msg","Ngo Name or Email is already Registered with us....");
			request.getRequestDispatcher("adminHome.jsp").include(request, response);
		}
	}
//Delete
	private void ngoDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NGO ngo= new NGO();
		ngo.setId(Integer.parseInt(request.getParameter("id")));
		boolean status = MainService.ngoDelete(ngo);
		if(status)
		{
			request.getRequestDispatcher("viewNgo.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("viewNgo.jsp").include(request, response);
		}
		
	}

	/*All Logout*/
	private void allLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		request.setAttribute("msg", "You are Successfully Logout");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	
//Forget Password NGO

	
/*All Login Data*/
	private void allLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String type=request.getParameter("type");
		System.out.println(email);
		System.out.println(password);
		System.out.println(type);
		
		Login login=MainService.loginType(email,password,type);
		boolean status = login.isLogin();
		HttpSession session=request.getSession();
		if(status)
		{
		if(type.equals("admin")) {
			
			session.setAttribute("email", email);
			request.getRequestDispatcher("adminHome.jsp").forward(request, response);
		}
		else if(type.equals("user")) 
		{			
			session.setAttribute("email", email);
			request.getRequestDispatcher("userHome.jsp").forward(request, response);
		}
		else
		{
			session.setAttribute("email", email);
			request.getRequestDispatcher("ngoHome.jsp").forward(request, response);
		}
		}
		else {
			request.setAttribute("msg", "Email or Password is Incorrect!!");
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
				
		
	}
/*Admin Data*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}