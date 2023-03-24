package com.aptech.Dao;

import java.sql.*;
import java.util.ArrayList;

import com.aptech.Model.Customer;
import com.aptech.Model.Product;
import com.aptech.Model.ProductDetail;

public class CustomerDao {
	private UtilDb utilDb;

	public CustomerDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}
	
	public ArrayList<Customer> getAll() {
		ArrayList<Customer> list = new ArrayList<Customer>();

		String query = "SELECT * FROM Customer";
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Customer item = new Customer();
				item.setId(rs.getInt("id"));
				item.setFullName(rs.getString("FullName"));
				item.setEmail(rs.getString("Email"));
				item.setPassword(rs.getString("Password"));
				item.setAddress(rs.getString("Address"));
				item.setPhoneNumber(rs.getString("PhoneNumber"));
				item.setStatus(rs.getBoolean("Status"));
        		
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}

	public Customer getAccountLogin(String email, String password) {
		Customer customer = new Customer();
		String query = "select * from customer where Email= ? and Password =?";
		
		try {
			PreparedStatement pre = utilDb.getConnection().prepareStatement(query);
			pre.setString(1, email);
			pre.setString(2, password);
			ResultSet rs = pre.executeQuery();
			if(rs.next()) {
				customer.setId(rs.getInt("Id"));
				customer.setEmail(email);
				customer.setPassword(password);
				customer.setAddress(rs.getString("Address"));
				customer.setFullName(rs.getString("FullName"));
				customer.setPhoneNumber(rs.getString("PhoneNumber"));
				return customer;
			}
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
	
	
	public boolean addNew(Customer customer) {
		String query = "insert into Customer (FullName, Password, Email, PhoneNumber, Address, Status) values (?,?,?,?,?,1)";
		
		try {
			PreparedStatement pre = utilDb.getConnection().prepareStatement(query);
			pre.setString(1, customer.getFullName());
			pre.setString(2, customer.getPassword());
			pre.setString(3, customer.getEmail());
			pre.setString(4, customer.getPhoneNumber());
			pre.setString(5, customer.getAddress());
			
			int rs = pre.executeUpdate();
			if(rs!=0)
				return true;
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return false;
	}
	
	public boolean update(Customer customer) {
		String query = "UPDATE Customer SET FullName = ?, Password = ?, Email = ?, PhoneNumber = ?, Address = ?, Status = 1 WHERE Id = ?";
		
		try {
			PreparedStatement pre = utilDb.getConnection().prepareStatement(query);
			pre.setString(1, customer.getFullName());
			pre.setString(2, customer.getPassword());
			pre.setString(3, customer.getEmail());
			pre.setString(4, customer.getPhoneNumber());
			pre.setString(5, customer.getAddress());
			pre.setInt(6, customer.getId());
			int rs = pre.executeUpdate();
			if(rs!=0)
				return true;
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return false;
	}

	public Customer getAccount(int id) {
		String sql = "SELECT * FROM Customer WHERE Id = " + id;
		Customer customer = new Customer();
		try {
			Statement stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			
			if(rs.next()) {
				customer.setId(rs.getInt("Id"));
				customer.setEmail(rs.getString("Email"));
				customer.setPassword(rs.getString("Password"));
				customer.setAddress(rs.getString("Address"));
				customer.setFullName(rs.getString("FullName"));
				customer.setPhoneNumber(rs.getString("PhoneNumber"));
				customer.setStatus(rs.getBoolean("Status"));
				return customer;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
	
	public boolean turnOff(int id){
        String sql="update Customer set Status=0 where Id=?";
        try{
            PreparedStatement pstm=utilDb.getConnection().prepareStatement(sql);
            pstm.setInt(1, id);
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
	
	public boolean turnOn(int id){
        String sql="update Customer set Status=1 where Id=?";
        try{
            PreparedStatement pstm=utilDb.getConnection().prepareStatement(sql);
            pstm.setInt(1, id);
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
	
	public boolean delete(int id) {
		String sql1 = "delete from Customer where Id=? and Status=0";
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
	
	public String getPassword(int id) {
		String sql = "SELECT Password FROM Customer WHERE Id = " +id;
		try {
			Statement stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			if (rs.next()) {
				return rs.getString("Password");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}
}
