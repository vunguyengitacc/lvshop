package javaweb.controller.Login;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javaweb.controller.Validator.AccountValidator;
import javaweb.services.inter.LoginService;

@Controller
public class RegisterController {

	@Autowired
	LoginService loginService;
	
	@Autowired
	AccountValidator accountValidator;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registration(HttpServletRequest request,
			@Valid @ModelAttribute("loginBean") javaweb.Entity.Account loginBean, BindingResult bindingResult,
			Model model) {
		accountValidator.validate(loginBean, bindingResult);
		if (bindingResult.hasErrors()) {
			request.setAttribute("message", "Mật khẩu không trùng khớp!");
			return "login/login";
		}
		byte a = 1;
		loginBean.setStatus(a);
		loginBean.setType(1);
		loginService.saveAccount(loginBean);
		request.setAttribute("message", "Tạo tài khoản thành công!");
		return "login/login";
	}
}