package com.aptech.Controller.User;

import java.util.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.aptech.Dao.CategoryDao;

import com.aptech.Dao.CustomerDao;
import com.aptech.Dao.ImageDao;

import com.aptech.Dao.InvoiceDao;
import com.aptech.Dao.InvoiceDetailDao;
import com.aptech.Dao.ProductDao;
import com.aptech.Dao.ProductDetailDao;
import com.aptech.Model.Cart;
import com.aptech.Model.Customer;
import com.aptech.Model.Invoice;
import com.aptech.Model.InvoiceDetail;
import com.aptech.Model.Staff;

@Controller
public class InvoiceController {

	// Hàm xử lý check out
	@RequestMapping(value = { "/checkOutHandelling" }, method = RequestMethod.GET)
	public RedirectView checkOutHandelling(Model model, HttpServletRequest request, RedirectAttributes redir) {
		model.addAttribute("customer", new Customer());
		HttpSession session = request.getSession();
		// Lấy khách hiện tại ra
		Customer currentCustomer = new Customer();
		currentCustomer = (Customer) session.getAttribute("currentCustomer");

		// Lấy giỏ hàng ra
		ArrayList<Cart> curCart = new ArrayList<Cart>();
		curCart = (ArrayList<Cart>) session.getAttribute("curCart");
		// Xử lý thêm vào db
		// Đầu tiên tạo 1 cái invoice
		Invoice invoice = new Invoice();
		invoice.setCustomer(currentCustomer);
//				invoice.setStaff(null);
		invoice.setCreateDate(new Date());

		// Tính tổng tiền trong giỏ hàng
		int totalPrice = 0;
		for (Cart cart : curCart) {
			totalPrice = cart.getPrice() * cart.getQuantity() + totalPrice;
		}
		invoice.setTotalPrice(totalPrice);

		InvoiceDao invoiceDao = new InvoiceDao();
		invoiceDao.addNew(invoice);

		// Rồi lấy cái cuối ra để có id
		invoice = invoiceDao.getLast();

		// Sau đó thêm vào các invoice Details
		for (Cart cart : curCart) {
			InvoiceDetail invoiceDetail = new InvoiceDetail();
			InvoiceDetailDao invoiceDetailDao = new InvoiceDetailDao();
			invoiceDetail.setInvoice(invoice);
			invoiceDetail.setProductDetail(cart.getProductDetail());
			invoiceDetail.setQuantity(cart.getQuantity());
			invoiceDetail.setUnit(cart.getPrice());
			invoiceDetailDao.addNew(invoiceDetail);
		}
		// Xóa session Cart đi
		
		session.removeAttribute("curCart");
		curCart = new ArrayList<Cart>();		
		session.setAttribute("curCart", curCart);
		String url = "/account/"+currentCustomer.getId()+"/ShoppingHistory";
		RedirectView redirectView = new RedirectView("/account/"+currentCustomer.getId()+"/ShoppingHistory", true);
//		redir.addFlashAttribute("listInvoice", invoiceDao.getAll() );
//		redir.addFlashAttribute("productTypeList", categoryDao.getAllProductType() );
//		redir.addFlashAttribute("sportTypeList", categoryDao.getAllSportType() );

		return redirectView;
	}

	// Hàm đưa người dùng ra lịch sử mua hàng
	@RequestMapping(value = { "/account/{accountID}/ShoppingHistory" }, method = RequestMethod.GET)
	public ModelAndView ShoppingHistory(Model model, HttpServletRequest request, @PathVariable("accountID") int accountID) {
		ModelAndView mv = new ModelAndView("/user/ShoppingHistory");
		InvoiceDao invoiceDao = new InvoiceDao();
		CategoryDao categoryDao = new CategoryDao();
		mv.addObject("listInvoice", invoiceDao.getByCustomerId(accountID));
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		
		
		return mv;
	}
	
	@RequestMapping(value = { "admin/invoiceList" }, method = RequestMethod.GET)
	public ModelAndView invoiceList(Model model) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		model.addAttribute("staff", new Staff());
		InvoiceDao invoiceDao = new InvoiceDao();
		model.addAttribute("invoiceList", invoiceDao.getAll());
		ModelAndView mv = new ModelAndView("admin/invoiceList");
		
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());
		
		return mv;
	}
	
	@RequestMapping(value = { "/admin/invoiceDetail/{id}" }, method = RequestMethod.GET)
	public ModelAndView invoiceDetail(Model model, @PathVariable("id") int id) {
		InvoiceDao invDao = new InvoiceDao();
		Invoice inv = invDao.getById(id);
		InvoiceDetailDao invDetailDao = new InvoiceDetailDao();
		CategoryDao cateDao = new CategoryDao();
		
		model.addAttribute("staff", new Staff());
		
		ModelAndView mv = new ModelAndView("admin/invoiceDetail");
		
		mv.addObject("InvoiceDetail", invDetailDao.getByInvoiceId(id));
		mv.addObject("invoice", invDao.getById(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/process" }, method = RequestMethod.GET)
	public void process(@RequestParam int inv, @RequestParam int staff) {
		
		InvoiceDao invDao = new InvoiceDao();
		invDao.process(staff, inv);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/deleteInvoice" }, method = RequestMethod.GET)
	public void deleteInvoice(@RequestParam int id) {
		
		InvoiceDao invDao = new InvoiceDao();
		InvoiceDetailDao detailDao = new InvoiceDetailDao();
		detailDao.deleteByInvoiceId(id);
		invDao.delete(id);
		
	}
}
