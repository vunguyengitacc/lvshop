package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

@Service("District")
public class District implements javaweb.services.inter.District {

	DBContext factory = new DBContext();

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.District> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List<javaweb.Entity.District> rs = ss.createCriteria(javaweb.Entity.District.class).list();
		ss.close();
		return rs;
	}

	@Override
	public javaweb.Entity.District getByWardID(int wardId) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.District rs = (javaweb.Entity.District) ss.createCriteria(javaweb.Entity.District.class)
				.add(Restrictions.eq("wards.id", wardId)).uniqueResult();
		ss.close();
		return rs;
	}

}
