package code.med.connection;

import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import code.med.entity.Donate;
import code.med.entity.Login;
import code.med.entity.NGO;
import code.med.entity.RequestData;
import code.med.entity.User;




public class DAO {

	private static SessionFactory sfact;

	public static SessionFactory getSfact() 
	{
		if(sfact==null)
		{
			try {
				Configuration cfg=new Configuration();
				
				Properties settings=new Properties();
				settings.put(Environment.DRIVER,"com.mysql.jdbc.Driver");
				settings.put(Environment.URL,"jdbc:mysql://localhost:3306/medidb?useSSL=false");
				settings.put(Environment.USER,"root");
				settings.put(Environment.PASS,"Root@007#");
				settings.put(Environment.DIALECT,"org.hibernate.dialect.MySQL5Dialect");
				settings.put(Environment.SHOW_SQL,"true");
				
				settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS,"thread");
				
				settings.put(Environment.HBM2DDL_AUTO,"update");
				
				cfg.setProperties(settings);
				cfg.addAnnotatedClass(User.class);
				cfg.addAnnotatedClass(Login.class);
				cfg.addAnnotatedClass(NGO.class);
				cfg.addAnnotatedClass(Donate.class);
				cfg.addAnnotatedClass(RequestData.class);
				
				ServiceRegistry servreg=new StandardServiceRegistryBuilder().
						applySettings(cfg.getProperties()).build();
				System.out.println("configuration Service Registry Created");
				
				sfact=cfg.buildSessionFactory(servreg);
				return sfact;
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return sfact;
	}
}

