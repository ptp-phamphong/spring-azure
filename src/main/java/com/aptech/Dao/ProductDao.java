package com.aptech.Dao;

import java.sql.*;
import java.util.ArrayList;

import javax.mail.Session;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aptech.Model.Product;
import com.aptech.Model.ProductDetail;

public class ProductDao {

	private UtilDb utilDb;

	public ProductDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}

	public ArrayList<Product> getAll() {
		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT TOP 25 * FROM Product";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
            	
            	ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
        		ProductDetailDao productDetailDao = new ProductDetailDao();
        		item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
        		
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	
	public ArrayList<Product> getAll_25() {
		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT TOP 25 * FROM Product";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
            	
            	ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
        		ProductDetailDao productDetailDao = new ProductDetailDao();
        		item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
        		
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	public Product getNewProduct() {
		String query = "SELECT TOP 1 * FROM Product order by Id desc";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
            	
            	ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
        		ProductDetailDao productDetailDao = new ProductDetailDao();
        		item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
        		return item;
			}
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return null;
	}
	
	public ArrayList<Product> getAllProduct() {

		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT * FROM Product";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
//            	ProductDetailDao productDetailDao = new ProductDetailDao();
//            	item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
            	
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	
	
	
	public ArrayList<Product> getByType(int type) {

		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT * FROM Product WHERE ProductTypeId="+type;
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
//            	ProductDetailDao productDetailDao = new ProductDetailDao();
//            	item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
            	
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	
	public ArrayList<Product> getBySport(int sport) {

		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT * FROM Product WHERE SportTypeId="+sport;
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
//            	ProductDetailDao productDetailDao = new ProductDetailDao();
//            	item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
            	
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}

	public Product getByProductID(int productID) {
		String sql = "SELECT * FROM Product WHERE Id = " + productID;
		try {
			CategoryDao categoryDao = new CategoryDao();
			Statement stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			if (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));
				
				item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
				
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
            	

				return item;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public Product getLastProduct() {
		String sql = "SELECT TOP 1 *  FROM Product ORDER BY Id DESC";
		CategoryDao categoryDao = new CategoryDao();
		try {
			Statement stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			if (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));
				
				item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
				
				ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));

				return item;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public ArrayList<Product> getIndexListProduct(){
		
		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT TOP 4 * FROM Product ORDER BY NEWID()";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
         	
        		ProductDetailDao productDetailDao = new ProductDetailDao();
        		item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
            	
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return null;
	}
	
	public ArrayList<Product> getIndexFeaturedProduct(){
		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT TOP 8 * FROM Product ORDER BY NEWID()";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
//            	
            	ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
        		ProductDetailDao productDetailDao = new ProductDetailDao();
        		item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
        		
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return null;
	}
	
	public ArrayList<Product> getNewestProduct(){
		ArrayList<Product> list = new ArrayList<Product>();

		String query = "SELECT TOP 8 * FROM Product ORDER BY Product.Id DESC";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
//            	
            	ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
        		ProductDetailDao productDetailDao = new ProductDetailDao();
        		item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
        		
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return null;
	}
	
	@Transactional
	public boolean add(int ProductTypeId, int SportTypeId, String name, String details, float discount){		
        String query="insert into Product(ProductTypeId, SportTypeId, Name, Details, Discount, Status) values(?,?,?,?,?,?)";
        ProductDetailDao proDao = new ProductDetailDao();
        try {
        	PreparedStatement pstm=utilDb.getConnection().prepareStatement(query);
            pstm.setInt(1, ProductTypeId);
            pstm.setInt(2, SportTypeId);
            pstm.setString(3, name);
            pstm.setString(4, details);
            pstm.setFloat(5, discount);
            pstm.setBoolean(6, true);
            int rs = pstm.executeUpdate();
            if(rs!=0){
                return true;         
            }
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        return false;
    }
	
	public boolean edit(int ProductTypeId, int SportTypeId, String name, String details, float discount, int id){
        String sql="update Product set ProductTypeId=?, SportTypeId=?, Name=?, Details=?, Discount=? where Id=?";
        try{
            PreparedStatement pstm=utilDb.getConnection().prepareStatement(sql);
            pstm.setInt(1, ProductTypeId);
            pstm.setInt(2, SportTypeId);
            pstm.setString(3, name);
            pstm.setString(4, details);
            pstm.setFloat(5, discount);
            pstm.setInt(6, id);
            int rs = pstm.executeUpdate();
            if(rs!=0){
                return true;         
            }  
        }
        catch(SQLException ex){
        	System.out.print("abc");
        }
        return false;  
    }
	
	public ArrayList<Product> getByProductType(int productTypeId) {
		String sql = "SELECT * FROM Product WHERE ProductTypeId = " + productTypeId ;
		return getProductbySQL(sql);
	}
	
	public ArrayList<Product> getBySportType(int productTypeId, int sportTypeId) {
		String sql = "SELECT * FROM Product WHERE ProductTypeId = " + productTypeId + " AND SportTypeId = "+ sportTypeId;
		return getProductbySQL(sql);
	}
	
	
	//đỡ viết hàm nhiều
	public ArrayList<Product> getProductbySQL(String sql) {

		ArrayList<Product> list = new ArrayList<Product>();
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Product item = new Product();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDetails(rs.getString("Details"));
				item.setDiscount(rs.getInt("Discount"));

            	item.setProductType(categoryDao.getProductTypeByID(rs.getInt("ProductTypeId")));
            	item.setSportType(categoryDao.getSportTypeByID(rs.getInt("SportTypeId")));
            	
            	//Thêm mấy tấm ảnh nữa
            	ImageDao imageDao = new ImageDao();
            	item.setImages(imageDao.getByIdProduct(rs.getInt("id")));
            	
            	ArrayList<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
        		ProductDetailDao productDetailDao = new ProductDetailDao();
        		item.setProductDetails(productDetailDao.getByIdProduct(rs.getInt("id")));
        		
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	
	public boolean delete(int id) {
		String sql1 = "delete from Product where Id=?";
		try {
			PreparedStatement pstm = utilDb.getConnection().prepareStatement(sql1);
			pstm.setInt(1, id);
			int rs1 = pstm.executeUpdate();
			if (rs1 != 0)
				return true;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteBySport(int id) {
		String sql1 = "delete from Product where SportTypeId=?";
		try {
			PreparedStatement pstm = utilDb.getConnection().prepareStatement(sql1);
			pstm.setInt(1, id);
			int rs1 = pstm.executeUpdate();
			if (rs1 != 0)
				return true;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}
}
