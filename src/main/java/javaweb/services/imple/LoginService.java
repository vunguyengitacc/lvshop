package javaweb.services.imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javaweb.Entity.Account;

@Service("loginService")
public class LoginService implements javaweb.services.inter.LoginService {

	@Autowired
	javaweb.services.inter.Account loginDAO;



	@Override
	public boolean isUser(String username, String password) {
		javaweb.Entity.Account account = loginDAO.findByUserName(username);
		if (account != null && account.getPassword().equals(password) && account.getStatus() == 1
				&& account.getType() == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean isAdmin(String username, String password) {
		javaweb.Entity.Account account = loginDAO.findByUserName(username);
		if (account != null && account.getPassword().equals(password) && account.getStatus() == 1
				&& account.getType() == 0) {
			return true;
		}
		return false;
	}

	@Override
	public void saveAccount(Account account) {
		loginDAO.saveAccount(account);
	}

	@Override
	public Account findByUserName(String username) {
		return loginDAO.findByUserName(username);
	}

	@Override
	public Account findByEmail(String email) {
		return loginDAO.findByEmail(email);
	}

	@Override
	public void updateResetPasswordToken(String token, String email) throws CustomerNotFoundException {
		Account a = loginDAO.findByEmail(email);
		if (a != null) {
			a.setResetPasswordToken(token);
			loginDAO.updateAccount(a);
		} else {
			throw new CustomerNotFoundException("Không tìm thấy bất cứ tài khoản nào với email " + email);
		}
	}

	@Override
	public Account getByResetPasswordToken(String token) {
		return loginDAO.findByResetPasswordToken(token);
	}

	@Override
	public void updatePassword(Account account, String newPassword) {
		account.setPassword(newPassword);
		account.setResetPasswordToken(null);
		loginDAO.updateAccount(account);
	}

}