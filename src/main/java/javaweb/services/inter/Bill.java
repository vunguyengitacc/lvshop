package javaweb.services.inter;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javaweb.Entity.Account;

public interface Bill {
	
	
	public int postBill(Account acc, int comm, BigDecimal totalValue);

	public javaweb.Entity.Bill getByID(int billID);
	

	public List<javaweb.Entity.Bill> getAll();
	
	public List<javaweb.Entity.Bill> getAllFetch();
	
	public List<javaweb.Entity.Bill> getAllAdvance(HashMap<String, String> lstInput, List<String> lstField);
	
	public javaweb.Entity.Bill getByIdAdvance(int id ,List<String> lstField);
	
	public boolean deleteByID(int billID);
	
	public boolean putStatusByID(int billID);
	
}
