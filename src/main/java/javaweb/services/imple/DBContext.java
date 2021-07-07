package javaweb.services.imple;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Component;

@Component
public class DBContext{
	public static SessionFactory ssFactory = new Configuration().configure().buildSessionFactory();
	
	public Session getSession() {
		return ssFactory.openSession();
	}
}
