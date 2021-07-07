package javaweb.services.imple;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;


@Service("Account")
public class Account implements javaweb.services.inter.Account {

	DBContext factory = new DBContext();

	@Override
	public javaweb.Entity.Account getByUsernameAndPass(String username, String password, boolean isLazy) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs;
		if (isLazy == true)
			rs = ss.createQuery("FROM Account  WHERE username =:name AND password =:password")
					.setParameter("name", username).setParameter("password", password).list();
		else
			rs = ss.createQuery(
					"FROM Account u LEFT JOIN FETCH u.comments WHERE username =:name AND password =:password")
					.setParameter("name", username).setParameter("password", password).list();
		ss.close();
		if (rs.size() == 0)
			return null;
		return (javaweb.Entity.Account) rs.get(0);
	}

	@Override
	public javaweb.Entity.Account getByUsername(String username, boolean isLazy) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs;
		if (isLazy == true)
			rs = (javaweb.Entity.Account) ss.createQuery("FROM Account WHERE username=:name")
					.setParameter("name", username).uniqueResult();
		else
			rs = (javaweb.Entity.Account) ss
					.createQuery("FROM Account u LEFT JOIN FETCH u.comments WHERE username=:name")
					.setParameter("name", username).uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public boolean putAccountInfor(String username, String name, String email, String phone, int gender) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).uniqueResult();
		if (rs == null)
			return false;
		if (name != "" && name != rs.getName())
			rs.setName(name);
		if (email != "" && email != rs.getEmail())
			rs.setEmail(email);
		if (phone != "" && email != rs.getPhone())
			rs.setPhone(phone);
		if (gender != rs.getGender())
			rs.setGender(gender);
		ss.save(rs); 
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean putNewPass(String username, String newPass) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).uniqueResult();

		if (rs == null) {
			ss.close();
			return false;
		}
		rs.setPassword(newPass);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Account> getAll() {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("rawtypes")
		List rs = ss.createCriteria(javaweb.Entity.Account.class).list();
		ss.close();
		return rs;
	}

	@Override
	public javaweb.Entity.Account getByUsernameFetch(String username, String fetchField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings("deprecation")
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).setFetchMode(fetchField, FetchMode.EAGER).uniqueResult();
		ss.close();
		return rs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<javaweb.Entity.Account> getAllFetch(String fetchField) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings({ "rawtypes", "deprecation" })
		List rs = ss.createCriteria(javaweb.Entity.Account.class).setFetchMode(fetchField, FetchMode.EAGER)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		ss.close();
		return rs;
	}

	@Override
	public boolean putNewStatus(String username) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).uniqueResult();
		if (rs == null)
			return false;
		if (rs.getStatus() == 1)
			rs.setStatus((byte) 0);
		else
			rs.setStatus((byte) 1);
		ss.saveOrUpdate(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean putNewAvatar(String username, String url) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.Account rs = (javaweb.Entity.Account) ss.createCriteria(javaweb.Entity.Account.class)
				.add(Restrictions.eq("username", username)).uniqueResult();
		if(rs==null)
			return false;
		rs.setAvatar(url);
		ss.saveOrUpdate(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}


	//Tran Hai Long
	
	@Override
	public void saveAccount(javaweb.Entity.Account account) {
		Session session = factory.getSession();
		Transaction tx = session.beginTransaction();
		if (account != null) {
			try {
				session.save(account);
				tx.commit();
				session.close();
			} catch (Exception e) {
				tx.rollback();
				session.close();
				e.printStackTrace();
			}
		}
	}

	@Override
	public javaweb.Entity.Account findByUserName(String username) {
		javaweb.Entity.Account a = new javaweb.Entity.Account();
		Session session = factory.getSession();
		Transaction tx = session.beginTransaction();
		String hql = "from Account where username=?";
		try {
			Query query = session.createQuery(hql);
			query.setParameter(0, username);
			a = (javaweb.Entity.Account) query.uniqueResult();
			tx.commit();
			session.close();
		} catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public javaweb.Entity.Account findByEmail(String email) {
		javaweb.Entity.Account b = new javaweb.Entity.Account();
		Session session1 = factory.getSession();
		Transaction tx = session1.beginTransaction();
		String hq = "from Account where email=?";
		try {
			Query query1 = session1.createQuery(hq);
			query1.setParameter(0, email);
			b = (javaweb.Entity.Account) query1.uniqueResult();
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public javaweb.Entity.Account findByResetPasswordToken(String token) {
		javaweb.Entity.Account c = new javaweb.Entity.Account();
		Session session1 = factory.getSession();
		Transaction tx = session1.beginTransaction();
		String hq = "from Account where reset_password_token=?";
		try {
			Query query1 = session1.createQuery(hq);
			query1.setParameter(0, token);
			c = (javaweb.Entity.Account) query1.uniqueResult();
			tx.commit();
			session1.close();
		} catch (Exception e) {
			tx.rollback();
			session1.close();
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public void updateAccount(javaweb.Entity.Account account) {
		Session session = factory.getSession();
		Transaction tx = session.beginTransaction();
		if (account != null) {
			try {
				session.update(account);
				tx.commit();
				session.close();
			} catch (Exception e) {
				tx.rollback();
				session.close();
				e.printStackTrace();
			}
		}
	}
}	
