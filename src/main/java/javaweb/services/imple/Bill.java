package javaweb.services.imple;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.Account;
import javaweb.Entity.Commune;
import javaweb.services.inter.BillHasProductHasSize;

@Service("Bill")
public class Bill implements javaweb.services.inter.Bill {

	@Autowired
	javaweb.services.inter.Commune commnue;
	@Autowired
	BillHasProductHasSize detail;
	DBContext factory = new DBContext();

	@Override
	public int postBill(Account acc, int comm, BigDecimal totalValue) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Bill newBill = new javaweb.Entity.Bill();
		newBill.setAccount(acc);
		Commune commTemp = commnue.getById(comm);
		if (commTemp == null) {
			ss.close();
			return -1;
		}
		newBill.setCommune(commTemp);
		newBill.setCreateDate(new Date());
		newBill.setStatus((byte) 1);// 0 la da duoc xu ly ; 1 la dang cho xu ly; 2 la da bi cancel
		newBill.setTotalValue(totalValue);				
		ss.save(newBill);
		int idBill = newBill.getId();
		ss.getTransaction().commit();
		ss.close();

		return idBill;
	}

	@Override
	public javaweb.Entity.Bill getByID(int billID) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Bill rs = (javaweb.Entity.Bill) ss.createCriteria(javaweb.Entity.Bill.class)
				.add(Restrictions.eq("id", billID)).uniqueResult();
		ss.close();
		return rs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Bill> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs = ss.createCriteria(javaweb.Entity.Bill.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.list();
		return rs;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<javaweb.Entity.Bill> getAllFetch() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		List rs = ss.createCriteria(javaweb.Entity.Bill.class).setFetchMode("commune", FetchMode.JOIN)
				.setFetchMode("commune.ward", FetchMode.JOIN).setFetchMode("commune.ward.district", FetchMode.JOIN)
				.setFetchMode("billHasProductHasSizes", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return rs;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Bill> getAllAdvance(HashMap<String, String> lstInput, List<String> lstField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Criteria query = ss.createCriteria(javaweb.Entity.Bill.class);
		lstInput.forEach((key, value) -> query.add(Restrictions.eq(key, value)));
		lstField.forEach((item) -> query.setFetchMode(item, FetchMode.JOIN));
		query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<javaweb.Entity.Bill> rs = query.list();
		ss.close();
		return rs;
	}

	@Override
	public boolean deleteByID(int billID) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Bill rs = (javaweb.Entity.Bill) ss.createCriteria(javaweb.Entity.Bill.class)
				.add(Restrictions.eq("id", billID)).setFetchMode("billHasProductHasSizes", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).uniqueResult();
		if (rs == null)
			return false;
		if (rs.getBillHasProductHasSizes().size() != 0)
			return false;
		ss.delete(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean putStatusByID(int billID) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Bill rs = (javaweb.Entity.Bill) ss.createCriteria(javaweb.Entity.Bill.class)
				.add(Restrictions.eq("id", billID)).setFetchMode("billHasProductHasSizes", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).uniqueResult();
		if (rs == null)
			return false;
		rs.setStatus((byte) 0);
		ss.update(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public javaweb.Entity.Bill getByIdAdvance(int id, List<String> lstField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		Criteria query = ss.createCriteria(javaweb.Entity.Bill.class).add(Restrictions.eq("id", id));
		lstField.forEach((item)->query.setFetchMode(item, FetchMode.JOIN));
		query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		javaweb.Entity.Bill rs = (javaweb.Entity.Bill) query.uniqueResult();
		ss.close();
		return rs;
	}

}
