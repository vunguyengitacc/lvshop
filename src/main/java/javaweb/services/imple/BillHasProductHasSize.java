package javaweb.services.imple;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.BillHasProductHasSizeId;
import javaweb.services.inter.Bill;
import javaweb.services.inter.Product;
import javaweb.services.inter.Size;

@Service("ProductHasColorHasBill")
public class BillHasProductHasSize implements javaweb.services.inter.BillHasProductHasSize {

	@Autowired
	Size color;
	@Autowired
	Product pro;
	@Autowired
	Bill bill;
	@Autowired
	javaweb.services.inter.ProductHasSize pro_size;
	DBContext factory = new DBContext();

	@Override
	public boolean postNew(int sizeId, int productId, int billId, int amount) {
		Session ss = factory.getSession();
		ss.beginTransaction();
		javaweb.Entity.BillHasProductHasSize newItem = new javaweb.Entity.BillHasProductHasSize();
		javaweb.Entity.ProductHasSize proHasColTemp = pro_size.getByIDSizeAndProduct(productId, sizeId);
		javaweb.Entity.Bill billTemp = bill.getByID(billId);
		if (proHasColTemp == null || billTemp == null)
			return false;
		BillHasProductHasSizeId newId = new BillHasProductHasSizeId(); 
		newId.setBillId(billId);
		newId.setProductHasSizeSizeId(sizeId);
		newId.setProductHasSizeProductId(productId);
		newItem.setAmount(amount);
		newItem.setBill(billTemp);
		newItem.setId(newId);
		proHasColTemp.setAmount(proHasColTemp.getAmount() - amount);
		ss.update(proHasColTemp);
		ss.save(newItem);
		ss.getTransaction().commit();
		ss.close();
		return true;
	}

	@Override
	public boolean deleteByBillId(int billId) {
		Session ss = factory.getSession();
		ss.beginTransaction();

		List<String> lstField = new ArrayList<String>(
				List.of("billHasProductHasSizes", "billHasProductHasSizes.color", "billHasProductHasSizes.product"));
		javaweb.Entity.Bill billRs = bill.getByIdAdvance(billId, lstField);
		if (billRs == null)
			return false;
		billRs.getBillHasProductHasSizes().forEach((item) -> {
			javaweb.Entity.ProductHasSize temp = item.getProductHasSize();
			if (temp != null) {
				temp.setAmount(temp.getAmount() + item.getAmount());
				ss.saveOrUpdate(temp);
			}
			javaweb.Entity.BillHasProductHasSize deleteItem = new javaweb.Entity.BillHasProductHasSize();
			deleteItem.setId(item.getId());
			ss.delete(deleteItem);
			ss.getTransaction().commit();
		});
		ss.close();
		return true;
	}

}
