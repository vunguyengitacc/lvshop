package javaweb.controller.session;

import javaweb.Entity.Account;

public class UserSession {
	public UserSession() {
		super();
	}

	public UserSession(Account accInfor) {
		super();
		this.accInfor = accInfor;
	}

	private Account accInfor;

	public Account getAccInfor() {
		return accInfor;
	}

	public void setAccInfor(Account accInfor) {
		this.accInfor = accInfor;
	}
	
	
}
