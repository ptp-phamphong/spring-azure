package com.aptech.Controller.User;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.aptech.Dao.CategoryDao;
import com.aptech.Dao.ImageDao;
import com.aptech.Dao.ProductDao;
import com.aptech.Dao.ProductDetailDao;
import com.aptech.Dao.SizeDao;
import com.aptech.Model.Cart;
import com.aptech.Model.Customer;
import com.aptech.Model.Product;
import com.aptech.Model.Staff;
import com.aptech.Model.ProductDetail;
import com.aptech.Model.ProductType;
import com.aptech.Model.Size;
import com.aptech.Model.SportType;
import com.aptech.MyClass.SendingEmail;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import antlr.collections.List;

@Controller
public class ProductController {

	@RequestMapping(value = { "/all-product" }, method = RequestMethod.GET)
	public ModelAndView showProductList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("productFilterList");
		ProductDao productDao = new ProductDao();
		CategoryDao categoryDao = new CategoryDao();
		model.addAttribute("customer", new Customer());
		ModelAndView mv = new ModelAndView("user/productList");

		mv.addObject("listProduct", productDao.getAll());
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	@RequestMapping(value = {
			"/{productType}-{productTypeId:\\d+}/{sportType}-{sportTypeId:\\d+}" }, method = RequestMethod.GET)
	public ModelAndView showProductbySportType(Model model,
			@PathVariable(value = "productTypeId") Integer productTypeID,
			@PathVariable(value = "sportTypeId") Integer sportTypeID, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("productFilterList");
		ProductDao productDao = new ProductDao();
		CategoryDao categoryDao = new CategoryDao();
		model.addAttribute("customer", new Customer());
		ModelAndView mv = new ModelAndView("user/productList");
		mv.addObject("listProduct", productDao.getBySportType(productTypeID, sportTypeID));
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	@RequestMapping(value = { "/{productType}-{productTypeId:\\d+}" }, method = RequestMethod.GET)
	public ModelAndView showProductbyType(Model model, @PathVariable(value = "productTypeId") Integer productTypeID,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("productFilterList");
		ProductDao productDao = new ProductDao();
		CategoryDao categoryDao = new CategoryDao();
		model.addAttribute("customer", new Customer());
		ModelAndView mv = new ModelAndView("user/productList");
		mv.addObject("listProduct", productDao.getByProductType(productTypeID));
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = { "/ChangeImageProduct" }, method = RequestMethod.GET)
	public String ChangeImageProduct(@RequestParam String imgItem) {

		String html = "";
		String url = "/SportShop/assets/user/images/products/" + imgItem + ".jpg";

		html += "<img src='" + url + "' alt=\"product\" />";
		return html;
	}

	@ResponseBody
	@RequestMapping(value = { "/DeleteProduct" }, method = RequestMethod.GET)
	public void DeleteProduct(@RequestParam int proItem) {
		ProductDao proDao = new ProductDao();
		ProductDetailDao detailDao = new ProductDetailDao();
		ImageDao imgDao = new ImageDao();

		imgDao.delete(proItem);
		detailDao.delete(proItem);
		proDao.delete(proItem);
	}

	@RequestMapping(value = { "/admin/product/sport/{sport}" }, method = RequestMethod.GET)
	public ModelAndView showAdminProductListBySport(Model model, @PathVariable("sport") int sport) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/product");

		if (sport == 0) {
			mv.addObject("ProductTypeList", cateDao.getAllProductType());
			mv.addObject("SportTypeList", cateDao.getAllSportType());
			mv.addObject("listProduct", productDao.getAllProduct());
		} else {
			mv.addObject("SportName", cateDao.getSportTypeByID(sport).getName());
			mv.addObject("ProductTypeList", cateDao.getAllProductType());
			mv.addObject("SportTypeList", cateDao.getAllSportType());
			mv.addObject("listProduct", productDao.getBySport(sport));
		}

		return mv;
	}

	@RequestMapping(value = { "/admin/product/type/{productType}" }, method = RequestMethod.GET)
	public ModelAndView showAdminProductListByType(Model model, @PathVariable("productType") int productType) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/product");

		if (productType == 0) {
			mv.addObject("ProductTypeList", cateDao.getAllProductType());
			mv.addObject("SportTypeList", cateDao.getAllSportType());
			mv.addObject("listProduct", productDao.getAllProduct());
		} else {
			mv.addObject("ProductTypeName", cateDao.getProductTypeByID(productType).getName());
			mv.addObject("ProductTypeList", cateDao.getAllProductType());
			mv.addObject("SportTypeList", cateDao.getAllSportType());
			mv.addObject("listProduct", productDao.getByType(productType));
		}

		return mv;
	}

	@RequestMapping(value = { "/admin/productDetail/{id}" }, method = RequestMethod.GET)
	public ModelAndView showAdminProductDetail(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		ImageDao imgDao = new ImageDao();
		ProductDetailDao productDetailDao = new ProductDetailDao();
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/productDetail");

		mv.addObject("ProductDetail", productDetailDao.getByIdProduct(id));
		mv.addObject("Product", productDao.getByProductID(id));
		mv.addObject("MainImage", imgDao.getByIdProduct(id).get(0));
		mv.addObject("Images", imgDao.getByIdProduct(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/admin/editproduct/{id}" }, method = RequestMethod.GET)
	public ModelAndView editProduct(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		ImageDao imgDao = new ImageDao();
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/editproduct");

		mv.addObject("Product", productDao.getByProductID(id));
		mv.addObject("MainImage", imgDao.getByIdProduct(id).get(0));
		mv.addObject("Images", imgDao.getByIdProduct(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@RequestMapping(value = { "/admin/importProduct/{id}" }, method = RequestMethod.GET)
	public ModelAndView importProduct(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		ProductDetailDao productDetailDao = new ProductDetailDao();
		ImageDao imgDao = new ImageDao();
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/importProduct");

		mv.addObject("ProductDetail", productDetailDao.getByIdProduct(id));
		mv.addObject("Product", productDao.getByProductID(id));
		mv.addObject("MainImage", imgDao.getByIdProduct(id).get(0));
		mv.addObject("Images", imgDao.getByIdProduct(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}
	
	@RequestMapping(value = { "/admin/exportProduct/{id}" }, method = RequestMethod.GET)
	public ModelAndView exportProduct(Model model, @PathVariable("id") int id) {
		ProductDao productDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		ProductDetailDao productDetailDao = new ProductDetailDao();
		ImageDao imgDao = new ImageDao();
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/exportProduct");

		mv.addObject("ProductDetail", productDetailDao.getByIdProduct(id));
		mv.addObject("Product", productDao.getByProductID(id));
		mv.addObject("MainImage", imgDao.getByIdProduct(id).get(0));
		mv.addObject("Images", imgDao.getByIdProduct(id));
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}
	
	@RequestMapping(value = { "/admin/addProduct" }, method = RequestMethod.GET)
	public ModelAndView addProduct(Model model) {
		ProductDao proDao = new ProductDao();
		CategoryDao cateDao = new CategoryDao();
		SizeDao sizeDao = new SizeDao();
		ImageDao imgDao = new ImageDao();
		model.addAttribute("staff", new Staff());
		ModelAndView mv = new ModelAndView("admin/addProduct");

		mv.addObject("SizeList", sizeDao.getAll());
		mv.addObject("ProductTypeList", cateDao.getAllProductType());
		mv.addObject("SportTypeList", cateDao.getAllSportType());

		return mv;
	}

	@Autowired
	ServletContext context;

	@PostMapping("UploadFile")
	@ResponseBody
	public String UploadFile(MultipartHttpServletRequest request) {
		String path_save_file = context.getRealPath("/assets/user/images/products/");
		Iterator<String> listNames = request.getFileNames();

		MultipartFile mpf = request.getFile(listNames.next());

		File file_save = new File(path_save_file + mpf.getOriginalFilename());
		try {
			mpf.transferTo(file_save);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "true";
	}

	@PostMapping("UploadFile1")
	@ResponseBody
	public String UploadFile1(MultipartHttpServletRequest request) {
		String path_save_file = context.getRealPath("/assets/user/images/products/");
		Iterator<String> listNames = request.getFileNames();
		MultipartFile mpf = request.getFile(listNames.next());

		File file_save = new File(path_save_file + mpf.getOriginalFilename());
		try {
			mpf.transferTo(file_save);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "true";
	}

	@PostMapping("UploadFile2")
	@ResponseBody
	public String UploadFile2(MultipartHttpServletRequest request) {
		String path_save_file = context.getRealPath("/assets/user/images/products/");
		Iterator<String> listNames = request.getFileNames();
		MultipartFile mpf = request.getFile(listNames.next());

		File file_save = new File(path_save_file + mpf.getOriginalFilename());
		try {
			mpf.transferTo(file_save);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "true";
	}

	@PostMapping("editProduct")
	@ResponseBody
	public void editProduct(@RequestParam String datajson) {
		ObjectMapper objectMapper = new ObjectMapper();

		JsonNode jsonObject;
		try {
			Product product = new Product();
			ProductDao proDao = new ProductDao();
			jsonObject = objectMapper.readTree(datajson);

			String name = jsonObject.get("name").asText();
			String detail = jsonObject.get("details").asText();
			int discount = jsonObject.get("discount").asInt();
			int type = jsonObject.get("productType").asInt();
			int sport = jsonObject.get("sportType").asInt();
			int id = jsonObject.get("id").asInt();

			if (sport == -1) {
				SportType Newsport = new SportType();
				CategoryDao cateDao = new CategoryDao();
				String sportName = jsonObject.get("other").asText();
				cateDao.addSport(sportName);
				Newsport = cateDao.getNewSport();
				int newSport = Newsport.getId();
				proDao.edit(type, newSport, name, detail, discount, id);
			} else {
				proDao.edit(type, sport, name, detail, discount, id);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@PostMapping("importProduct")
	@ResponseBody
	public void importProduct(@RequestParam String datajson) {
		ObjectMapper objectMapper = new ObjectMapper();

		JsonNode jsonObject;

		ProductDetail productdetail = new ProductDetail();
		ProductDetailDao productdetailDao = new ProductDetailDao();

		try {
			jsonObject = objectMapper.readTree(datajson);

			for (JsonNode object : jsonObject) {
				int id = object.get("id").asInt();
				int imp = object.get("import").asInt();

				int inventory = productdetailDao.getById(id).getInventory() + imp;

				productdetailDao.importProduct(inventory, id);
			}
			System.out.println(jsonObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@PostMapping("exportProduct")
	@ResponseBody
	public void exportProduct(@RequestParam String datajson) {
		ObjectMapper objectMapper = new ObjectMapper();
		
		JsonNode jsonObject;
		
		ProductDetail productdetail = new ProductDetail();
		ProductDetailDao productdetailDao = new ProductDetailDao();
		
		try {
			jsonObject = objectMapper.readTree(datajson);
			
			for (JsonNode object : jsonObject) {
				int id = object.get("id").asInt();
				int imp = object.get("export").asInt();
				
				int inventory = productdetailDao.getById(id).getInventory() -imp;
				
				productdetailDao.importProduct(inventory, id);
			}
			System.out.println(jsonObject);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@PostMapping("addNewProduct")
	@ResponseBody
	public void addNewProduct(@RequestParam String datajson) {
		ObjectMapper objectMapper = new ObjectMapper();

		JsonNode jsonObject;
		try {
			Product product = new Product();
			ProductDao proDao = new ProductDao();
			jsonObject = objectMapper.readTree(datajson);

			String name = jsonObject.get("name").asText();
			String detail = jsonObject.get("details").asText();
			int discount = jsonObject.get("discount").asInt();
			int type = jsonObject.get("productType").asInt();
			int sport = jsonObject.get("sportType").asInt();

			if (sport == -1) {
				SportType Newsport = new SportType();
				CategoryDao cateDao = new CategoryDao();
				String sportName = jsonObject.get("other").asText();
				cateDao.addSport(sportName);
				Newsport = cateDao.getNewSport();
				int newSport = Newsport.getId();
				proDao.add(type, newSport, name, detail, discount);
			} else {
				proDao.add(type, sport, name, detail, discount);
			}

			product = proDao.getNewProduct();

			JsonNode jsonDetail = jsonObject.get("ProductDetails");

			for (JsonNode objectDetail : jsonDetail) {
				ProductDetailDao productDetailDao = new ProductDetailDao();
				int size = objectDetail.get("size").asInt();
				int proId = product.getId();
				int price = objectDetail.get("price").asInt();
				int inventory = objectDetail.get("inventory").asInt();
				productDetailDao.add(size, proId, inventory, price);
			}

			JsonNode jsonImage = jsonObject.get("Images");
			for (JsonNode objectImage : jsonImage) {
				ImageDao imgDao = new ImageDao();
				int proId = product.getId();
				String nameImg = objectImage.get("img").asText();
				imgDao.add(proId, nameImg);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = { "/{productType}/{sportType}/{productID:\\d+}",
			"/{productType}/{sportType}/{productID:\\d+}/**" }, method = RequestMethod.GET)
	// \d:+ chỉ nhận giá trị int
	public ModelAndView showProductDetails(Model model, HttpServletRequest request,
			@PathVariable("productID") int productID) {
		ProductDao productDao = new ProductDao();
		model.addAttribute("customer", new Customer());
		ModelAndView mv = new ModelAndView("user/product");
		mv.addObject("productDetails", productDao.getByProductID(productID));

		// Lấy ra các productDetails thuộc về sản phẩm này để hiển thị bên view
		ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
		ProductDetailDao productDetailDao = new ProductDetailDao();
		listProductDetails = productDetailDao.getByIdProduct(productID);
		mv.addObject("listProductDetails", listProductDetails);

		mv.addObject("item", productDao.getByProductID(productID));
		mv.addObject("nextProduct", productDao.getByProductID(productID + 1));
		if (productID == 1) {
			mv.addObject("prevProduct", productDao.getLastProduct());
		} else {
			mv.addObject("prevProduct", productDao.getByProductID(productID - 1));
		}
		CategoryDao categoryDao = new CategoryDao();
		mv.addObject("productTypeList", categoryDao.getAllProductType());
		mv.addObject("sportTypeList", categoryDao.getAllSportType());
		return mv;
	}

	// Các hàm xử lý giỏ hàng
	@ResponseBody
	@RequestMapping(value = { "/addToCart" }, method = RequestMethod.POST)
	public String sendEmail(HttpServletRequest request) {
		int idProduct = Integer.parseInt(request.getParameter("idProduct"));

		HttpSession session = request.getSession();
		ArrayList<Cart> curCart = new ArrayList<Cart>();
		curCart = (ArrayList<Cart>) session.getAttribute("cart");

		if (curCart == null) {// Nếu trong cart chưa có gì
			curCart = new ArrayList<Cart>();

			Cart newItem = new Cart();
			ProductDao productDao = new ProductDao();
			ProductDetailDao productDetailDao = new ProductDetailDao();
			Product productToCart = new Product();
			productToCart = productDao.getByProductID(Integer.parseInt(request.getParameter("idProduct")));
			// newItem.set
			newItem.setQuantity(1);
			newItem.setPrice(productDetailDao.getByIdProduct(idProduct).get(0).getPrice());
			newItem.setProductDetail(productDetailDao.getByIdProduct(idProduct).get(0));
			curCart.add(newItem);
			session.setAttribute("curCart", curCart);
		}

		return "done";
	}

	// Hết hàm rồi đấy, đmẹ đáng lẽ nên xài cái service

	@ResponseBody
	@RequestMapping(value = { "/ajax/showProductList" }, method = RequestMethod.GET)
	public ModelAndView showProductList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/user/productList");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = { "/ajax/quickView/{productID}" }, method = RequestMethod.GET)
	public ModelAndView showquickView(HttpServletRequest request, @PathVariable("productID") int productID) {
		ProductDao productDao = new ProductDao();

		ModelAndView mv = new ModelAndView("/user/quick-view");
		mv.addObject("product", productDao.getByProductID(productID));
		// Lấy ra các productDetails thuộc về sản phẩm này để hiển thị bên view
		ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
		ProductDetailDao productDetailDao = new ProductDetailDao();
		listProductDetails = productDetailDao.getByIdProduct(productID);
		mv.addObject("listProductDetails", listProductDetails);

		return mv;
	}
}
