package javaweb.controller.Validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javaweb.Entity.Account;
import javaweb.services.inter.LoginService;

@Component
public class ForgotPassValidator implements Validator {
	@Autowired
	LoginService loginService;

	@Override
	public boolean supports(Class<?> clazz) {
		return Account.class.equals(clazz);
	}

	@Override
	public void validate(Object t, Errors error) {
		Account a = (Account) t;
		if (loginService.findByEmail(a.getEmail()) == null) {
			t = loginService.findByEmail(a.getEmail());
			error.rejectValue("email", "Duplicate.userForm.mail");
		}
	}
}