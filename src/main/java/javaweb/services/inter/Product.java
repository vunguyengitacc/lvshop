package javaweb.services.inter;

import java.math.BigDecimal;
import java.util.List;

public interface Product {
	public List<javaweb.Entity.Product> getAll();
	public List<javaweb.Entity.Product> getAllFetch(List<String> lstField);

	public List<javaweb.Entity.Product> getByTradeMark(String tradeMark);

	public javaweb.Entity.Product getByID(int id, boolean isLazy);

	public int postNew(String name, BigDecimal originalPrice, BigDecimal price, BigDecimal promotionPrice,
			String image, String description, int idTrade);

	public boolean putByID(int id, String name, BigDecimal originalPrice, BigDecimal price, BigDecimal promotionPrice,
			String image, String description, int idTrade);

	public boolean deleteByID(int id);
}
