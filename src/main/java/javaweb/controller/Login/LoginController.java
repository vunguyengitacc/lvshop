package javaweb.controller.Login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javaweb.Entity.Account;
import javaweb.controller.session.UserSession;
import javaweb.services.inter.LoginService;

@Controller
public class LoginController {
	private static final Logger logger = Logger.getLogger(LoginController.class.getName());

	@Autowired
	LoginService loginService;

	@Autowired
	javaweb.services.inter.Account acc;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		logger.info("Request Login.");
		ModelAndView view = new ModelAndView("login/login");
		Account loginBean = new Account();
		view.addObject("loginBean", loginBean);
		logger.info("Open login page.");
		return view;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String executeLogin(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("loginBean") Account loginBean, Model model, HttpSession session) {
				
		Account accLogging = acc.getByUsername(loginBean.getUsername(), true);
		if (loginService.isUser(loginBean.getUsername(), loginBean.getPassword())&&accLogging.getStatus()==1) {
			request.setAttribute("loggedInUser", loginBean.getUsername());
			session.setAttribute("UserSession", new UserSession(accLogging));
			return "redirect:/trang-chu/";
		} else if (loginService.isAdmin(loginBean.getUsername(), loginBean.getPassword())&&accLogging.getStatus()==1) {
			request.setAttribute("loggedInUser", loginBean.getUsername());
			session.setAttribute("UserSession", new UserSession(accLogging));
			return "redirect:/admin/quan-li-chung";
		} else if(accLogging!=null && accLogging.getStatus()==0){
			model.addAttribute("message", "Tài khoản của bạn đã bị khoá!");
			return "redirect:/login";
		} else{
			model.addAttribute("message", "Tài khoản hoặc mật khẩu không hợp lệ!");
			return "redirect:/login";
		}
	}
	
	
}