package com.aptech.Controller.User;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aptech.Dao.CategoryDao;
import com.aptech.Dao.InvoiceDao;
import com.aptech.Dao.InvoiceDetailDao;
import com.aptech.Dao.ProductDetailDao;
import com.aptech.Model.Cart;
import com.aptech.Model.Customer;
import com.aptech.Model.Invoice;
import com.aptech.Model.InvoiceDetail;
import com.aptech.Model.ProductDetail;

@Controller
public class CartController {

	// Các hàm xử lý giỏ hàng

	// Hiện ra giỏ hàng
	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public ModelAndView showCart(Model model, HttpServletRequest request) {
		model.addAttribute("customer", new Customer());

		ModelAndView mv = new ModelAndView("user/cart");
		CategoryDao categoryDao = new CategoryDao();
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	// Thêm sản phẩm vào giỏ hàng ở trang danh sách toàn bộ sản phẩm
	@ResponseBody
	@RequestMapping(value = { "/ajax/addItemToCart" }, method = RequestMethod.POST)
	public int addItemToCart(HttpServletRequest request) {
		ProductDetailDao productDetailDao = new ProductDetailDao();
		ProductDetail productToCart = new ProductDetail();
		int quantity = 1;

		if (!Boolean.parseBoolean(request.getParameter("inDetails"))) {
			productToCart = productDetailDao.getByIdProduct(Integer.parseInt(request.getParameter("idProduct"))).get(0);
		}

		if (Boolean.parseBoolean(request.getParameter("inDetails"))) {
			quantity = Integer.parseInt(request.getParameter("quantity").toString());
			productToCart = productDetailDao.getById(Integer.parseInt(request.getParameter("idProductDetails")));
		}

//		ModelAndView mv = new ModelAndView("/layouts/user/headerCart");
		return addItemToCartHandelling(productToCart, quantity, request);
	}

	// Thêm sản phẩm vào giỏ hàng ở chi tiết sản phẩm
	@ResponseBody
	@RequestMapping(value = { "/ajax/addItemToCartInDetail" }, method = RequestMethod.GET)
	public int addItemToCartInDetail(@ModelAttribute Customer customer, BindingResult bindingResult,
			HttpServletRequest request) {
		ProductDetailDao productDetailDao = new ProductDetailDao();
		ProductDetail productToCart = new ProductDetail();
		int quantity = Integer.parseInt(request.getParameter("quantity").toString());
		productToCart = productDetailDao.getById(Integer.parseInt(request.getParameter("idProduct")));

		return addItemToCartHandelling(productToCart, quantity, request);
	}

	// Hàm Ajax tăng số lượng trong giỏ hàng
	@ResponseBody
	@RequestMapping(value = { "/ajax/increseQuantity" }, method = RequestMethod.POST)
	public ModelAndView increseQuantity(HttpServletRequest request) {
		int idProductDetail = Integer.parseInt(request.getParameter("idProductDetail"));

		HttpSession session = request.getSession();
		ArrayList<Cart> curCart = new ArrayList<Cart>();
		curCart = (ArrayList<Cart>) session.getAttribute("curCart");

		for (int i = 0; i < curCart.size(); i++) {
			if (curCart.get(i).getProductDetail().getId() == idProductDetail) {
				curCart.get(i).setQuantity(curCart.get(i).getQuantity() + 1);
				break;
			}
		}

		ModelAndView mv = new ModelAndView("user/cartDetail");
		return mv;
	}

	// Hàm ajax, giảm số lượng trong giỏ hàng
	@ResponseBody
	@RequestMapping(value = { "/ajax/decreaseQuantity" }, method = RequestMethod.POST)
	public ModelAndView decreaseQuantity(HttpServletRequest request) {
		int idProductDetail = Integer.parseInt(request.getParameter("idProductDetail"));
		HttpSession session = request.getSession();
		ArrayList<Cart> curCart = new ArrayList<Cart>();
		curCart = (ArrayList<Cart>) session.getAttribute("curCart");

		for (int i = 0; i < curCart.size(); i++) {
			if (curCart.get(i).getProductDetail().getId() == idProductDetail) {
				if (curCart.get(i).getQuantity() == 1) // Nếu số lượng là 1 rồi mà còn muốn giảm thì dell cho giảm
					break;
				curCart.get(i).setQuantity(curCart.get(i).getQuantity() - 1);
				break;
			}
		}

		ModelAndView mv = new ModelAndView("user/cartDetail");
		return mv;
	}

	// Hàm ajax, xóa 1 phần tử khỏi giỏ hàng
	@ResponseBody
	@RequestMapping(value = { "/ajax/removeItemCart" }, method = RequestMethod.POST)
	public int removeItemCart(HttpServletRequest request) {
		int idProductDetail = Integer.parseInt(request.getParameter("idProductDetail"));
		HttpSession session = request.getSession();
		ArrayList<Cart> curCart = new ArrayList<Cart>();
		curCart = (ArrayList<Cart>) session.getAttribute("curCart");

		for (int i = 0; i < curCart.size(); i++) {
			if (curCart.get(i).getProductDetail().getId() == idProductDetail) {
				curCart.remove(i);
				break;
			}
		}

		
		return curCart.size();
	}

	// Trả về header Cart để in ra.
	@ResponseBody
	@RequestMapping(value = { "/ajax/showHeaderCart" }, method = RequestMethod.GET)
	public ModelAndView showHeaderCart(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/layouts/user/headerCart");
		return mv;
	}

	// Trả về productStack để in ra.
	@RequestMapping(value = { "/ajax/productStack" }, method = RequestMethod.GET)
	public ModelAndView productStack() {
		ModelAndView mv = new ModelAndView("/user/productStack");
		return mv;
	}
	
	@RequestMapping(value = { "/ajax/showMainCart" }, method = RequestMethod.GET)
	public ModelAndView showMainCart() {
		ModelAndView mv = new ModelAndView("user/cartDetail");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/ajax/getCartSize" }, method = RequestMethod.POST)
	public int getCartSize(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<Cart> curCart = new ArrayList<Cart>();
		curCart = (ArrayList<Cart>) session.getAttribute("curCart");
		if (curCart == null) {
			return 0;
		}
		return curCart.size();
	}
	
	@ResponseBody
	@RequestMapping(value = { "/ajax/clearAllCart" }, method = RequestMethod.POST)
	public int clearAllCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("curCart");
		
		ArrayList<Cart> curCart = new ArrayList<Cart>();		
		session.setAttribute("curCart", curCart);
		return curCart.size();
	}
	
	// Hết hàm rồi đấy, đmẹ đáng lẽ nên xài cái service

	// Các hàm tự viết
	private int addItemToCartHandelling(ProductDetail productToCart, int quantity, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ArrayList<Cart> curCart = new ArrayList<Cart>();
		curCart = (ArrayList<Cart>) session.getAttribute("curCart");

		if (curCart == null) {// Nếu trong cart chưa có gì
			curCart = new ArrayList<Cart>();// Khởi tạo mới được
			Cart newItem = new Cart();
			newItem.setQuantity(quantity);
			newItem.setPrice(productToCart.getPrice());
			newItem.setProductDetail(productToCart);
			newItem.setProductDetailsID(productToCart.getId());
			curCart.add(newItem);
			session.setAttribute("curCart", curCart);
			return curCart.size();
		}

		// Nếu trong cart có gì đó rồi, thì phải xét xem món đó đã từng nằm trong cart
		// chưa, nếu có thì chỉ tăng số lượng lên quantity thôi
		for (int i = 0; i < curCart.size(); i++) {
			if (productToCart.getId() == curCart.get(i).getProductDetailsID()) {// Nếu từng có rồi
				curCart.get(i).setQuantity(curCart.get(i).getQuantity() + quantity);
				session.setAttribute("curCart", curCart);
				return curCart.size();
			}
		}

		// Nếu đây là 1 món hoàn toàn mới
		Cart newItem = new Cart();
		newItem.setQuantity(quantity);
		newItem.setPrice(productToCart.getPrice());
		newItem.setProductDetail(productToCart);
		newItem.setProductDetailsID(productToCart.getId());
		curCart.add(newItem);
		session.setAttribute("curCart", curCart);
		return curCart.size();
	}

}
