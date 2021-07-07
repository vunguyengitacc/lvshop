package javaweb.services.inter;

public interface BillHasProductHasSize {
	public boolean postNew(int sizeId, int productId, int billId, int amount);
	
	public boolean deleteByBillId(int billId);
}
