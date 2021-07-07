package javaweb.services.imple;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

@Service("Ward")
public class Ward implements javaweb.services.inter.Ward {

	DBContext factory = new DBContext();

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<javaweb.Entity.Ward> getByDistrictID(int districtId) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.Ward.class).add(Restrictions.eq("district.id", districtId)).list();
		ss.close();
		return rs;
	}

	@Override
	public javaweb.Entity.Ward getByCommuntID(int communeId) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Ward rs = (javaweb.Entity.Ward) ss.createCriteria(javaweb.Entity.Ward.class)
				.add(Restrictions.eq("commnues.id", communeId)).uniqueResult();
		ss.close();
		return rs;
	}

}
