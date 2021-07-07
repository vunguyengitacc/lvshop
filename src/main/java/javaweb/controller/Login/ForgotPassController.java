package javaweb.controller.Login;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javaweb.Entity.Account;
import javaweb.controller.Validator.*;
import javaweb.services.imple.CustomerNotFoundException;
import javaweb.services.inter.LoginService;
import javaweb.services.site.Utility;

@Controller
public class ForgotPassController {

	@Autowired
	private LoginService loginService;

	@Autowired
	AccountValidator accountValidator;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public ModelAndView showForgotPass(HttpServletRequest request, HttpServletResponse response) {
		Account Bean = new Account();
		ModelAndView view = new ModelAndView("login/forgotPassword");
		view.addObject("Bean", Bean);
		return view;
	}

	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public String forgotPass(HttpServletRequest request, @ModelAttribute("Bean") javaweb.Entity.Account Bean,
			BindingResult Result, Model model) {
		String email = request.getParameter("email");
		String token = RandomStringUtils.randomAlphabetic(20);
		try {
			loginService.updateResetPasswordToken(token, email);
			String resetPassLink = Utility.getSiteURL(request) + "/resetPassword?token=" + token;
			sendEmail(email, resetPassLink);
			request.setAttribute("message", "Mail tạo lại mật khẩu đã được gửi đến cho bạn. Xin hãy kiểm tra.");
		} catch (CustomerNotFoundException e) {
			request.setAttribute("message", e.getMessage());
		} catch (UnsupportedEncodingException | MessagingException e) {
			request.setAttribute("message", "Xảy ra lỗi khi gửi mail.");
		}

		return "login/forgotPassword";
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String showResetPass(@Param(value = "token") String token, Model model, HttpServletRequest request) {
		Account a = loginService.getByResetPasswordToken(token);
		if (a == null) {
			model.addAttribute("tille", "Đổi lại mật khẩu");
			model.addAttribute("message", "Token không hợp lệ");
			return "login/Message";
		}
		request.setAttribute("token", token);
		model.addAttribute("token", token);
		return "login/ResetPassword";
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String processResetPassModel(Model model, HttpServletRequest request,
			@ModelAttribute("a") javaweb.Entity.Account a, BindingResult result) {

		accountValidator.validate(a, result);
		if (result.hasErrors()) {
			request.setAttribute("message", "Cập nhật thất bại");
			return "login/ResetPassword";
		}
		String token = request.getParameter("token");
		String password = request.getParameter("password");
		Account acc = loginService.getByResetPasswordToken(token);
		if (acc == null) {
			model.addAttribute("tille", "Đổi lại mật khẩu");
			model.addAttribute("message", "Token không hợp lệ");
			return "login/Message";
		}else {
			loginService.updatePassword(acc, password);
			request.setAttribute("message", "Đổi mật khẩu thành công.");
			return "login/login";
		}
		
	}

	private void sendEmail(String email, String resetPassLink) throws UnsupportedEncodingException, MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("contract@HVL.com", "HVL support");
		helper.setTo(email);
		String subject = "Here's the link to reset your password";

		String content = "<p>Hello, </p>" + "<p>You have requested to reset your password.</p>"
				+ "<p>Click the link below to change your password:</p>" + "<p><b><a href=\"" + resetPassLink
				+ "\">Change my password</a></b></p>"
				+ "<p>Ignore this mail if you do remember your password, or you have not made the request.</p>";
		helper.setSubject(subject);
		helper.setText(content, true);
		mailSender.send(message);
	}
}