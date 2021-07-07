package javaweb.services.inter;

import java.util.List;



public interface Account {
	public List<javaweb.Entity.Account> getAll();
	public List<javaweb.Entity.Account> getAllFetch(String lstFetch);
	
	public javaweb.Entity.Account getByUsernameAndPass(String username, String password,boolean isLazy);
	public javaweb.Entity.Account getByUsername(String username,boolean isLazy);
	public javaweb.Entity.Account getByUsernameFetch(String username, String fetchField);
	
	public boolean putAccountInfor(String username, String name, String email, String phone, int gender);
	public boolean putNewPass(String username, String newPass);
	public boolean putNewStatus(String username);
	public boolean putNewAvatar(String username, String url);
	
	public javaweb.Entity.Account findByUserName(String username);
	public javaweb.Entity.Account findByEmail(String email);
	public void saveAccount(javaweb.Entity.Account account); 
	public void updateAccount(javaweb.Entity.Account account);
	public javaweb.Entity.Account findByResetPasswordToken(String token);
}
