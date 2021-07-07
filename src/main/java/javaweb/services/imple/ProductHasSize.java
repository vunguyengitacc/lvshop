package javaweb.services.imple;

import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.ProductHasSizeId;
import javaweb.services.inter.Product;
import javaweb.services.inter.Size;

@Service("ProductHasColor")
public class ProductHasSize implements javaweb.services.inter.ProductHasSize {

	DBContext factory = new DBContext();
	@Autowired
	Size size;
	@Autowired
	Product pro;

	@Override
	public int getAmount(int idProduct, int idSize) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasSize rs = (javaweb.Entity.ProductHasSize) ss
				.createCriteria(javaweb.Entity.ProductHasSize.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("size.id", idSize)).uniqueResult();
		ss.close();
		if (rs != null)
			return rs.getAmount();
		return 0;
	}

	@Override
	public javaweb.Entity.ProductHasSize getByIDSizeAndProduct(int idProduct, int idSize) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasSize rs = (javaweb.Entity.ProductHasSize) ss
				.createCriteria(javaweb.Entity.ProductHasSize.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("size.id", idSize)).uniqueResult();
		ss.close();
		return rs;
	}

	@Override
	public boolean postNew(int idProduct, int idSize, int amount) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasSize rs = (javaweb.Entity.ProductHasSize) ss
				.createCriteria(javaweb.Entity.ProductHasSize.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("size.id", idSize)).uniqueResult();
		if (rs != null)
			return false;
		rs = new javaweb.Entity.ProductHasSize();
		javaweb.Entity.Size colItem = size.getByID(idSize);
		javaweb.Entity.Product proItem = pro.getByID(idProduct, false);
		if(colItem==null||proItem==null)
			return false;
		rs.setId(new ProductHasSizeId());
		rs.getId().setSizeId(idSize);
		rs.getId().setProductId(idProduct);
		rs.setSize(colItem);
		rs.setProduct(proItem);
		rs.setAmount(amount);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean put(int idProduct, int idSize, int amount) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasSize rs = (javaweb.Entity.ProductHasSize) ss
				.createCriteria(javaweb.Entity.ProductHasSize.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("size.id", idSize)).uniqueResult();
		if (rs == null)
			return false;
		rs.setAmount(amount);
		ss.save(rs);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean deleteOne(int idProduct, int idSize) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.ProductHasSize rs = (javaweb.Entity.ProductHasSize) ss
				.createCriteria(javaweb.Entity.ProductHasSize.class).add(Restrictions.eq("product.id", idProduct))
				.add(Restrictions.eq("size.id", idSize)).setFetchMode("billHasProductHasSizes", FetchMode.JOIN)
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
	public boolean deleteMany(int idProduct) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		@SuppressWarnings({ "unchecked" })
		List<javaweb.Entity.ProductHasSize> rs = ss.createCriteria(javaweb.Entity.ProductHasSize.class)
				.add(Restrictions.eq("product.id", idProduct)).setFetchMode("billHasProductHasSizes", FetchMode.JOIN)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		if (rs.size() == 0)
			return true;
		if (rs.stream().filter((item) -> item.getBillHasProductHasSizes().size() > 0).collect(Collectors.toList())
				.size() != 0)
			return false;
		rs.forEach((item)->ss.delete(item));;
		ss.getTransaction().commit();
		ss.flush();
		ss.close();
		return true;
	}

}
