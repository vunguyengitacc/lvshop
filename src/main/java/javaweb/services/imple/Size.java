package javaweb.services.imple;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

@Service("Color")
public class Size implements javaweb.services.inter.Size {
	DBContext factory = new DBContext();

	@Override
	public javaweb.Entity.Size getByID(int id) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Size rs = (javaweb.Entity.Size) ss.createCriteria(javaweb.Entity.Size.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public javaweb.Entity.Size postNew(String newColorName) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Size temp = (javaweb.Entity.Size) ss.createCriteria(javaweb.Entity.Size.class)
				.add(Restrictions.eq("name", newColorName)).uniqueResult();
		if (temp != null)
			return temp;
		temp = new javaweb.Entity.Size();
		temp.setName(newColorName);
		ss.save(temp);
		javaweb.Entity.Size tempRS = temp;
		ss.getTransaction().commit();
		ss.close();
		return tempRS;
	}

}
