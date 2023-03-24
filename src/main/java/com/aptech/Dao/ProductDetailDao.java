package com.aptech.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.aptech.Model.Image;
import com.aptech.Model.ProductDetail;
import com.aptech.Model.Size;

public class ProductDetailDao {

	private UtilDb utilDb;
	
	
	public ProductDetailDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}
	
	
	public ArrayList<ProductDetail> getByIdProduct(int id){
		ArrayList<ProductDetail> list = new ArrayList<ProductDetail>();
		
		String query = "SELECT * FROM ProductDetails WHERE ProductId = " + id;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				ProductDetail item = new ProductDetail();
				item.setId(rs.getInt("id"));
				item.setInventory(rs.getInt(("Inventory")));
				item.setPrice(rs.getInt(("Price")));
				
				//Lấy khóa ngoại
				ProductDao productDao = new ProductDao();
				item.setProduct(productDao.getByProductID(rs.getInt("ProductId")));
				SizeDao sizeDao = new SizeDao();
				item.setSize(sizeDao.getById(rs.getInt("SizeId")));
				
				
				list.add(item);
			}
			
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		
		return list;
	}
	
	public ProductDetail getById(int id) {
		String query = "SELECT * FROM ProductDetails WHERE Id = " + id;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				ProductDetail item = new ProductDetail();
				item.setId(rs.getInt("id"));
				item.setInventory(rs.getInt(("Inventory")));
				item.setPrice(rs.getInt(("Price")));
				
				//Lấy khóa ngoại
				ProductDao productDao = new ProductDao();
				item.setProduct(productDao.getByProductID(rs.getInt("ProductId")));
				SizeDao sizeDao = new SizeDao();
				item.setSize(sizeDao.getById(rs.getInt("SizeId")));
				
				return item;
			}
			
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		
		return null;
	}
	
	public boolean add(int SizeId, int ProductId, int inventory, int price){		
        String query="insert into ProductDetails(SizeId, ProductId, Inventory, Price) values(?,?,?,?)";
        ProductDetailDao proDao = new ProductDetailDao();
        try {
        	PreparedStatement pstm=utilDb.getConnection().prepareStatement(query);
            pstm.setInt(1, SizeId);
            pstm.setInt(2, ProductId);
            pstm.setInt(3, inventory);
            pstm.setInt(4, price);
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
	
	public boolean delete(int id) {
		String sql1 = "delete from ProductDetails where ProductId=?";
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
	
	public boolean importProduct(int inventory, int id){
        String sql="update ProductDetails set Inventory=? where Id=?";
        try{
            PreparedStatement pstm=utilDb.getConnection().prepareStatement(sql);
            pstm.setInt(1, inventory);
            pstm.setInt(2, id);
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
}
