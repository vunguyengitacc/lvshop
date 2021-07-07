package javaweb.services.imple;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import javaweb.Entity.Trademark;

@Service("TradeMark")
public class TradeMark implements javaweb.services.inter.TradeMark {
	
	DBContext factory = new DBContext();

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Trademark> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(Trademark.class).setFetchMode("products", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		ss.close();
		return rs;
	}

	@Override
	public Trademark getByID(int ID) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Trademark rs = (Trademark) ss.createQuery("FROM Trademark WHERE id = :ID").setParameter("ID", ID);
		ss.close();
		return rs;
	}

	@Override
	public Trademark postNew(String name) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Trademark temp = (Trademark) ss.createCriteria(Trademark.class).add(Restrictions.eq("name", name))
				.uniqueResult();
		if (temp != null)
			return null;
		temp = new Trademark();
		temp.setName(name);
		ss.save(temp);
		Trademark tempRS = temp;
		ss.getTransaction().commit();
		ss.close();
		return tempRS;
	}

}
