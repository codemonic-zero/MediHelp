package code.med.services;

import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import code.med.connection.DAO;
import code.med.entity.Donate;
import code.med.entity.Login;
import code.med.entity.NGO;
import code.med.entity.RequestData;
import code.med.entity.User;


public class MainService {

/*User data*/
	//Registration
	public static boolean saveorUpdateUser(User usr) 
	{
				
		Transaction trans=null;
				try {
					Session session=DAO.getSfact().openSession();
					trans=session.beginTransaction();
					
					String email=usr.getUemail();
					String mobile=usr.getUmobile();
					Query q=session.createQuery("from User where umobile=:usrmobile or uemail=:usremail");
					  q.setParameter("usrmobile",mobile);
					  q.setParameter("usremail",email);
					List<User> listUsr=q.getResultList();
					if(listUsr.size()>0)
					{
						System.out.println("List"+listUsr.size());
						return false;
					}
					else {
					session.save(usr);
					trans.commit();
					return true;
					}
				} catch (Exception e) {
					System.out.println(e);
				}
				return false;
		}
	//Update
	public static boolean updateUser(User usr) {
		
		Transaction trans=null;
		try {
			Session session=DAO.getSfact().openSession();
			trans=session.beginTransaction();
			//usr=(User)session.get(User.class, usr.getId());
			session.update(usr);
			trans.commit();
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	//Get User
	public static User getUsr(int id) {
		User u=null;
		Transaction transaction=null;
		try {
			Session session=DAO.getSfact().openSession();
			transaction=session.beginTransaction();
		
			u=(User)session.get(User.class,id);
			
			
			transaction.commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return u;
		
	}
	//getRequest
	public static Donate getRequest(int id) {
		Donate d=null;
		Transaction transaction=null;
		try {
			Session session=DAO.getSfact().openSession();
			transaction=session.beginTransaction();
		
			d=(Donate)session.get(Donate.class,id);
			
			
			transaction.commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return d;
		
	}
	
	//List
	public static List<User> viewAllUser()
	{
		List<User> usr = null;
		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			usr = session.createQuery("From User").getResultList();
			
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return usr;
		
	}
	
	//Delete
	public static boolean userDelete(User u) {
		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			u = (User)session.get(User.class, u.getId());
			session.delete(u);
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return false;
	}
	//Show User
	public static User showUser(int id)
	{
		User u=new User();
		Transaction transaction=null;
		try {
			Session session=DAO.getSfact().openSession();
			transaction=session.beginTransaction();
		
			u=(User)session.get(User.class,id);
			
			
			transaction.commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return u;
		
	}
		//Show Doner In User	
				public static User showDoner(String email) {
					System.out.println(email);
					User usr=new User();
					Transaction transaction = null;
					try
					{
						Session session = DAO.getSfact().openSession();
						transaction = session.beginTransaction();
						List<User> usrList=null;
						usrList=MainService.viewAllUser();
						usr = usrList.stream()
			                    .filter(x -> x.getUemail().equals(email))
			                    .findFirst()
			                    .orElse(null);
						if((usrList!=null)&&(usrList.size()>0)) 
						{
						transaction.commit();
						return usr;
						}
						else
						{
							return usr;
						}
					   
					}catch(Exception e)
					{
						System.out.println(e);
					}
					return usr;
				}
		//getUserByName
				public static User getUserByName(String email) {
					System.out.println(email);
					User u=new User();
					Transaction transaction = null;
					try
					{
						Session session = DAO.getSfact().openSession();
						transaction = session.beginTransaction();
						List<User> getUserByName=null;
						getUserByName=MainService.usrByName();
						u = getUserByName.stream()
			                    .filter(x -> x.getUemail().equals(email))
			                    .findFirst()
			                    .orElse(null);
						if((getUserByName!=null)&&(getUserByName.size()>0)) 
						{
						transaction.commit();
						return u;
						}
						else
						{
							return u;
						}
					   
					}catch(Exception e)
					{
						System.out.println(e);
					}
					return u;
				}
				
//usrByName		
	private static List<User> usrByName() {
		List<User> u = null;
		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			u = session.createQuery("From User").getResultList();
			
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return u;
	}
				//getNgoByName
				public static NGO getNgoByName(String email) {
					System.out.println(email);
					NGO ngo=new NGO();
					Transaction transaction = null;
					try
					{
						Session session = DAO.getSfact().openSession();
						transaction = session.beginTransaction();
						List<NGO> getNgoByName=null;
						getNgoByName=MainService.ngoByName();
						ngo = getNgoByName.stream()
			                    .filter(x -> x.getNgoemail().equals(email))
			                    .findFirst()
			                    .orElse(null);
						if((getNgoByName!=null)&&(getNgoByName.size()>0)) 
						{
						transaction.commit();
						return ngo;
						}
						else
						{
							return ngo;
						}
					   
					}catch(Exception e)
					{
						System.out.println(e);
					}
					return ngo;
				}

//ngoByName
	private static List<NGO> ngoByName() {
					
		List<NGO> ngo = null;
		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			ngo = session.createQuery("From NGO").getResultList();
			
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return ngo;
		
	}
				
	//Change Password User
				public static boolean forgetPass(String email, String pass, String type) {
					
					List<Login> loginList = null;
					List<User> usrList=null;
					List<NGO> ngoList=null;
				
					Transaction transaction = null;
					try
					{
						Session session = DAO.getSfact().openSession();
						transaction = session.beginTransaction();
						loginList=MainService.getLoginList();
						usrList=MainService.viewAllUser();
						ngoList=MainService.getNgoList();
						
						Login login = loginList.stream()
			                    .filter(x -> x.getEmail().equals(email))
			                    .findFirst()
			                    .orElse(null);
						User usr = usrList.stream()
			                    .filter(x -> x.getUemail().equals(email))
			                    .findFirst()
			                    .orElse(null);
						NGO ngo = ngoList.stream()
			                    .filter(x -> x.getNgoemail().equals(email))
			                    .findFirst()
			                    .orElse(null);
						if(login!=null) {
							System.out.println(pass);
							if(type.equals("user")) {
								//User Pass
								usr.setUpassword(pass);
								session.update(usr);
							}
							else if(type.equals("ngo")) {
								//NGO Pass
								ngo.setNgopass(pass);
								session.update(ngo);
							}
							
							System.out.println("Here is control 1");
						//Login Pass
						login.setPassword(pass);
						login.setLogin(true);
						session.update(login);
						
						transaction.commit();
						return true;
						}
						else
						{
							System.out.println("Here is control 2");
							login.setLogin(false);
							return false;
						}					   
					}catch(Exception e)
					{
						System.out.println(e);
					}
					System.out.println("Here is control 3");
				
					return false;
				}

/*NGO Data*/
	//Registration
	public static boolean saveNgoReg(NGO ngo) {
		
		Transaction trans=null;
		try {
			Session session=DAO.getSfact().openSession();
			trans=session.beginTransaction();
			
			String name=ngo.getNgoname();
			String email=ngo.getNgoemail();
			Query q=session.createQuery("from NGO where ngoname=:nname or ngoemail=:nemail");
			  q.setParameter("nname",name);
			  q.setParameter("nemail",email);
			List<NGO> listNgo=q.getResultList();
			if(listNgo.size()>0)
			{
				System.out.println("List Size"+listNgo.size());
				return false;
			}
			else {
			session.save(ngo);
			trans.commit();
			return true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	//List
	public static List<NGO> getNgoList()
	{
		List<NGO> ngo = null;
		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			ngo = session.createQuery("From NGO").getResultList();
			
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return ngo;
		
	}
	
	//Delete
	public static boolean ngoDelete(NGO ngo) {

		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			ngo = (NGO)session.get(NGO.class, ngo.getId());
			session.delete(ngo);
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return false;
	}
	//Show NGO
	public static NGO showNgo(int id)
	{
		NGO ngo=new NGO();
		Transaction transaction=null;
		try {
			Session session=DAO.getSfact().openSession();
			transaction=session.beginTransaction();
		
			ngo=(NGO)session.get(NGO.class,id);
			
			
			transaction.commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return ngo;
		
	}
/*All Login Data*/
	//Login Registration
	public static void saveLoginData(Login login) {
		
		Transaction trans=null;
		try {
			Session session=DAO.getSfact().openSession();
			trans=session.beginTransaction();
			session.save(login);
			trans.commit();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//Login Type
	public static Login loginType(String email, String password, String type) {
		
		
		Login login=new Login();
		try
		{
			Transaction transaction = null;
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			String SQL_QUERY   = "from Login as l where l.email=:email and l.password=:password and l.type=:type";
			Query q = session.createQuery(SQL_QUERY, Login.class);
			q.setParameter("email", email);
			q.setParameter("password", password);
			q.setParameter("type", type);
			//q.setParameter("id", user.getId());
			List<Login> list = q.list();
			if((list!=null)&&(list.size()>0))
			{
				login.setLogin(true);
				login.setEmail(email);
				//user.setId(id);
				return login;
			}
			else
			{
				login.setLogin(false);
				return login;
			}
		
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
		return login;
	}
	
	//Login List
	private static List<Login> getLoginList() {
		List<Login> login = null;
		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			login = session.createQuery("From Login").getResultList();
			
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return login;
	}

/*Donation Data*/
	//Registration
	public static boolean saveDonatedata(Donate donate) {
		
		Transaction trans=null;
		try {
			Session session=DAO.getSfact().openSession();
			trans=session.beginTransaction();
			session.save(donate);
			trans.commit();
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	//activeNgoList
	public static List<Donate> activeNgoList()
	{
		List<Donate> donate = null;
		Transaction transaction = null;
		try
		{
			donate.getClass();
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			donate = session.createQuery("From Donate where ngo:=ngoname").getResultList();
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return donate;
		
	}
	//List
	public static List<Donate> getDonateList()
	{
		List<Donate> donate = null;
		Transaction transaction = null;
		try
		{
			Session session = DAO.getSfact().openSession();
			transaction = session.beginTransaction();
			donate = session.createQuery("From Donate").getResultList();
			
			transaction.commit();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return donate;
		
	}
	//showDonate
	public static Donate showDonate(int id)
	{
		Donate d=new Donate();
		Transaction transaction=null;
		try {
			Session session=DAO.getSfact().openSession();
			transaction=session.beginTransaction();
		
			d=(Donate)session.get(Donate.class,id);
			
			
			transaction.commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return d;
		
	}
	
	public static boolean requestData(RequestData rd) {
		
		Transaction trans=null;
		try {
			Session session=DAO.getSfact().openSession();
			trans=session.beginTransaction();
			session.save(rd);
			trans.commit();
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}	

//getAllRequest
public static List<RequestData> getAllRequest(String name)
{
	List<RequestData> rd = null;
	Transaction transaction = null;
	
	try
	{
		Session session = DAO.getSfact().openSession();
		transaction = session.beginTransaction();
		Query q=session.createQuery("from RequestData where rngo=:ngo");
		//rd = session.createQuery("From RequestData where ngoemail:=ngoname").getResultList();
		q.setParameter("ngo",name);
		rd=q.getResultList();
		transaction.commit();
	}catch(Exception e)
	{
		System.out.println(e);
	}
	return rd;
	}
}
