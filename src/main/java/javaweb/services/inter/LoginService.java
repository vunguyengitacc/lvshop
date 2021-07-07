package javaweb.services.inter;

import javaweb.Entity.Account;
import javaweb.services.imple.CustomerNotFoundException;

public interface LoginService {
	public boolean isUser(String username, String password);
	public boolean isAdmin(String username, String password);
	public void saveAccount(javaweb.Entity.Account account);
	public Account findByUserName(String username);
	public Account findByEmail(String email);
	public void updateResetPasswordToken(String token, String email) throws CustomerNotFoundException;
	public Account getByResetPasswordToken(String token);
	public void updatePassword(Account account, String newPassword);
}