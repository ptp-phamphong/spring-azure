package com.aptech.Controller.User;

import java.io.IOException;

import java.net.http.HttpRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.codec.Hex;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.aptech.Dao.CategoryDao;
import com.aptech.Dao.CustomerDao;
import com.aptech.Dao.ImageDao;
import com.aptech.Dao.ProductDao;
import com.aptech.Dao.ProductDetailDao;
import com.aptech.Dao.StaffDao;
import com.aptech.Model.Customer;
import com.aptech.Model.Product;
import com.aptech.Model.SportType;
import com.aptech.Model.Staff;
import com.aptech.MyClass.HashPassword;
import com.aptech.MyClass.SendingEmail;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CustomerController {

	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public ModelAndView showViewRegister(Model model) {
		model.addAttribute("customer", new Customer());
		ModelAndView mv = new ModelAndView("user/register");
		CategoryDao categoryDao = new CategoryDao();
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = { "/sendEmailRegister" }, method = RequestMethod.POST)
	public String sendEmail(HttpServletRequest request) {
		SendingEmail sendingEmail = new SendingEmail();
		Random rand = new Random();
		int OTPCode = rand.nextInt(10000) + 10000;
		if (sendingEmail.sendEmail("OTP Code", "Your OTP Code is: " + OTPCode, request.getParameter("email"))) {
			request.getSession().setAttribute("OTPCode", OTPCode);
			return "Please type Your Code";

		}
		return "Wrong Email, please input again";
	}

	@RequestMapping(value = { "/registerHandelling" }, method = RequestMethod.POST)
	public ModelAndView registerHandelling(@ModelAttribute("customer") Customer item,
			@RequestParam("OTPCode") int OTPCode, RedirectAttributes redir, HttpServletRequest request) {
		int ROCode = (Integer) (request.getSession().getAttribute("OTPCode"));
		ModelAndView modelAndView = new ModelAndView("user/login");
		if (OTPCode != ROCode) {
			modelAndView.addObject("Error", "Please check your OTP Code");
			modelAndView = new ModelAndView("user/register");
		}

		HashPassword hashPassword = new HashPassword();
		item.setPassword(hashPassword.getPassInMD5(item.getPassword()));
		CustomerDao customerDao = new CustomerDao();

		if (!customerDao.addNew(item)) {
			modelAndView.addObject("Error", "Please check your OTP Code");
			modelAndView = new ModelAndView("user/register");
		}

		modelAndView.addObject("Error", "Congratulation, Please Login To Continue");
		return modelAndView;
	}

	@RequestMapping(value = { "admin/loginAdmin" }, method = RequestMethod.GET)
	public ModelAndView loginAdmin(Model model) {
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/loginAdmin");
		return mv;
	}

	@RequestMapping(value = { "admin/customerList" }, method = RequestMethod.GET)
	public ModelAndView customerList(Model model) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		model.addAttribute("staff", new Staff());
		CustomerDao cusDao = new CustomerDao();
		model.addAttribute("accountList", cusDao.getAll());
		ModelAndView mv = new ModelAndView("admin/customerAccountList");

		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "admin/staffAccountList" }, method = RequestMethod.GET)
	public ModelAndView staffAccountList(Model model) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		model.addAttribute("staff", new Staff());
		StaffDao staffDao = new StaffDao();
		model.addAttribute("accountList", staffDao.getAll());
		ModelAndView mv = new ModelAndView("admin/staffAccountList");

		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/admin/customerDetail/{id}" }, method = RequestMethod.GET)
	public ModelAndView customerDetail(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		CustomerDao cusDao = new CustomerDao();

		ModelAndView mv = new ModelAndView("admin/customerDetail");
		mv.addObject("Customer", cusDao.getAccount(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/admin/staffDetail/{id}" }, method = RequestMethod.GET)
	public ModelAndView staffDetail(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		StaffDao staffDao = new StaffDao();

		ModelAndView mv = new ModelAndView("admin/staffAccountDetail");
		mv.addObject("Staff", staffDao.getAccount(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/admin/profile/{id}" }, method = RequestMethod.GET)
	public ModelAndView profile(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		StaffDao staffDao = new StaffDao();

		ModelAndView mv = new ModelAndView("admin/profile");
		mv.addObject("Staff", staffDao.getAccount(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/admin/editAccountAdmin/{id}" }, method = RequestMethod.GET)
	public ModelAndView editAccountAdmin(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		StaffDao staffDao = new StaffDao();

		ModelAndView mv = new ModelAndView("admin/editAccountAdmin");
		mv.addObject("Staff", staffDao.getAccount(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/admin/changePasswordAdmin/{id}" }, method = RequestMethod.GET)
	public ModelAndView changePasswordAdmin(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		StaffDao staffDao = new StaffDao();

		ModelAndView mv = new ModelAndView("admin/changePasswordAdmin");
		mv.addObject("Staff", staffDao.getAccount(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public ModelAndView showViewLogin(Model model) {
		model.addAttribute("customer", new Customer());
		ModelAndView mv = new ModelAndView("user/login");
		CategoryDao categoryDao = new CategoryDao();
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	@RequestMapping(value = { "/loginHandelling" }, method = RequestMethod.POST)
	public RedirectView loginHandelling(@ModelAttribute("customer") Customer item, RedirectAttributes redir,
			HttpServletRequest request) {
		CustomerDao customerDao = new CustomerDao();
		Customer customer = new Customer();

		// Chuyển qua MD5
		HashPassword HashPassword = new HashPassword();
		String passMD5 = HashPassword.getPassInMD5(item.getPassword());

		customer = customerDao.getAccountLogin(item.getEmail(), passMD5);

		if (customer == null) {
			RedirectView redirectView = new RedirectView("/login", true);

			redir.addFlashAttribute("customer", new Customer());

			redir.addFlashAttribute("Error", "Wrong username or password, please try again");
			return redirectView;
		}

		RedirectView redirectView = new RedirectView("/all-product", true);
		request.getSession().setAttribute("currentCustomer", customer);

		// redir.addFlashAttribute("currentCustomer", customer);
		return redirectView;
	}

	@RequestMapping(value = { "/admin/loginAdminHandelling" }, method = RequestMethod.POST)
	public RedirectView loginAdminHandelling(@ModelAttribute("staff") Staff item, RedirectAttributes redir,
			HttpServletRequest request) {
		StaffDao staffDao = new StaffDao();
		Staff staff = new Staff();

		staff = staffDao.getAccountLogin(item.getUsername(), item.getPassword());

		if (staff == null) {
			RedirectView redirectView = new RedirectView("/admin/loginAdmin", true);

			redir.addFlashAttribute("staff", new Staff());

			redir.addFlashAttribute("Error", "Wrong username or password, please try again");
			return redirectView;
		}

		RedirectView redirectView = new RedirectView("/admin/index", true);
		request.getSession().setAttribute("currentStaff", staff);

		// redir.addFlashAttribute("currentCustomer", customer);
		return redirectView;
	}

	@RequestMapping(value = { "/logoutHandelling" })
	public RedirectView logoutHandelling(RedirectAttributes redir, HttpServletRequest request) {

		RedirectView redirectView = new RedirectView("/all-product", true);
		HttpSession session = request.getSession();
		session.invalidate();

		// redir.addFlashAttribute("currentCustomer", customer);
		return redirectView;
	}

	@RequestMapping(value = { "/admin/logoutAdminHandelling" })
	public RedirectView logoutAdminHandelling(RedirectAttributes redir, HttpServletRequest request) {

		RedirectView redirectView = new RedirectView("/admin/loginAdmin", true);
		HttpSession session = request.getSession();
		session.invalidate();

		// redir.addFlashAttribute("currentCustomer", customer);
		return redirectView;
	}

	@RequestMapping(value = { "/account/{id}" }, method = RequestMethod.GET)
	public ModelAndView showViewAccount(@PathVariable int id) {
		CustomerDao customerDAO = new CustomerDao();
		ModelAndView mv = new ModelAndView("user/account");
		Customer customer = customerDAO.getAccount(id);
		mv.addObject("customer", customer);
		CategoryDao categoryDao = new CategoryDao();
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = { "/editStatus" }, method = RequestMethod.GET)
	public void editStatus(@RequestParam int acc) {

		CustomerDao cusDao = new CustomerDao();
		Customer cus = cusDao.getAccount(acc);
		if (cus.getStatus()) {
			cusDao.turnOff(acc);
		} else {
			cusDao.turnOn(acc);
		}
	}

	@ResponseBody
	@RequestMapping(value = { "/editStatusAdmin" }, method = RequestMethod.GET)
	public void editStatusAdmin(@RequestParam int acc) {

		StaffDao staffDao = new StaffDao();
		Staff staff = staffDao.getAccount(acc);
		if (staff.getStatus()) {
			staffDao.turnOff(acc);
		} else {
			staffDao.turnOn(acc);
		}
	}

	@PostMapping("editProfileAdmin")
	@ResponseBody
	public void editProfileAdmin(@RequestParam String datajson) {
		ObjectMapper objectMapper = new ObjectMapper();

		JsonNode jsonObject;
		try {
			StaffDao staffDao = new StaffDao();
			jsonObject = objectMapper.readTree(datajson);

			String name = jsonObject.get("name").asText();
			String email = jsonObject.get("email").asText();
			String phone = jsonObject.get("phone").asText();
			String address = jsonObject.get("address").asText();
			int id = jsonObject.get("id").asInt();

			staffDao.edit(name, email, phone, address, id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@PostMapping("changePasswordAdmin")
	@ResponseBody
	public boolean changePasswordAdmin(@RequestParam String datajson) {
		ObjectMapper objectMapper = new ObjectMapper();

		JsonNode jsonObject;
		try {
			StaffDao staffDao = new StaffDao();
			jsonObject = objectMapper.readTree(datajson);

			String old = jsonObject.get("old").asText();
			String newp = jsonObject.get("newp").asText();
			String confirm = jsonObject.get("confirm").asText();
			int id = jsonObject.get("id").asInt();

			Staff staff = staffDao.getAccount(id);

			if (old.equals(staff.getPassword())==false) {
				return false;
			} else if (old.equals(newp)==false) {
				if (newp.equals(confirm)) {
					staffDao.changePass(confirm, id);
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping(value = { "/admin/changePasswordAdmin" })
	public RedirectView changePasswordAdmin(@RequestParam int id, @RequestParam String old, @RequestParam String newp, @RequestParam String confirm, RedirectAttributes redir, HttpServletRequest request) {
		StaffDao dao = new StaffDao();
		Staff staff = dao.getAccount(id);
		if(old.equals(staff.getPassword())==false) {
			redir.addFlashAttribute("Error", "Wrong old password!!!");
		}
		else if(newp.equals(old)) {
			redir.addFlashAttribute("Error", "Your new pass and old pass is same!!!");
		}
		else if(confirm.equals(newp)==false) {
			redir.addFlashAttribute("Error", "Your confirm new pass is wrong!!!");
		}
		RedirectView redirectView = new RedirectView("/admin/changePasswordAdmin", true);

		// redir.addFlashAttribute("currentCustomer", customer);
		return redirectView;
	}

	@ResponseBody
	@RequestMapping(value = { "/deleteAccount" }, method = RequestMethod.GET)
	public void deleteAccount(@RequestParam int acc) {
		CustomerDao cusDao = new CustomerDao();
		cusDao.delete(acc);
	}

	@ResponseBody
	@RequestMapping(value = { "/deleteAccountAdmin" }, method = RequestMethod.GET)
	public void deleteAccountAdmin(@RequestParam int acc) {
		StaffDao staffDao = new StaffDao();
		staffDao.delete(acc);
	}

	@ResponseBody
	@RequestMapping(value = { "/ajax/checkOldPassword" }, method = RequestMethod.POST)
	public String checkOldPassword(HttpServletRequest request) {
		HashPassword hashPassword = new HashPassword();
		String oldPassword = request.getParameter("oldPassword");

		if (oldPassword.equals("")) {
			return "fail";
		}

		int customerId = Integer.parseInt(request.getParameter("customerId"));

		oldPassword = hashPassword.getPassInMD5(oldPassword);
		CustomerDao customerDao = new CustomerDao();
		if (oldPassword.equals(customerDao.getPassword(customerId))) {
			return "success";
		}
		return "fail";
	}

	@ResponseBody
	@RequestMapping(value = { "/ajax/getMD5Password" }, method = RequestMethod.POST)
	public String getMD5Password(HttpServletRequest request) {
		String newPassword = request.getParameter("newPassword");
		return HashPassword.getPassInMD5(newPassword);
	}

	
	@RequestMapping(value = { "/updateAccountHandelling" }, method = RequestMethod.POST)
	public RedirectView updateAccountHandelling(@ModelAttribute("customer") Customer item, RedirectAttributes redir,
			HttpServletRequest request) {
		CustomerDao customerDao = new CustomerDao();
		
		customerDao.update(item);

		RedirectView redirectView = new RedirectView("/account/"+item.getId(), true);

		redir.addFlashAttribute("customer", item);

		return redirectView;
	}
}
