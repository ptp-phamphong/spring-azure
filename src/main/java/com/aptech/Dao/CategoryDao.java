package com.aptech.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.transaction.Transactional;

import com.aptech.Model.Product;
import com.aptech.Model.ProductDetail;
import com.aptech.Model.ProductType;
import com.aptech.Model.SportType;

public class CategoryDao {

	private UtilDb utilDb;

	public CategoryDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}
	
	public ArrayList<ProductType> getAllProductType() {

		ArrayList<ProductType> list = new ArrayList<ProductType>();

		String query = "SELECT * FROM ProductType";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				ProductType item = new ProductType();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("Name"));
				item.setStatus(rs.getBoolean("Status"));
            	
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	
	public ArrayList<SportType> getAllSportType() {

		ArrayList<SportType> list = new ArrayList<SportType>();

		String query = "SELECT * FROM SportType";
		Statement stm;
		try {
			CategoryDao categoryDao = new CategoryDao();
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				SportType item = new SportType();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("Name"));
				item.setStatus(rs.getBoolean("Status"));
            	
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	
	public ProductType getProductTypeByID(int id) {
		String query = "SELECT * FROM ProductType WHERE Id =" + id;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				ProductType item = new ProductType();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("Name"));
				item.setStatus(false);
				return item;
			}
			
		} catch (Exception ex) {
		}
		return null;
	}
	
	public SportType getSportTypeByID(int id) {
		String query = "SELECT * FROM SportType WHERE Id =" + id;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				SportType item = new SportType();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("Name"));
				item.setStatus(false);
				return item;
			}
		} catch (Exception ex) {
		}
		return null;
	}
	
	@Transactional
	public boolean addSport(String Name){		
        String query="insert into SportType(Name, Status) values(?,?)";
        ProductDetailDao proDao = new ProductDetailDao();
        try {
        	PreparedStatement pstm=utilDb.getConnection().prepareStatement(query);
            pstm.setString(1, Name);
            pstm.setBoolean(2, true);
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
	
	public SportType getNewSport() {
		String query = "SELECT TOP 1 * FROM SportType order by Id desc";
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				SportType item = new SportType();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setStatus(true);
        		return item;
			}
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return null;
	}
}
