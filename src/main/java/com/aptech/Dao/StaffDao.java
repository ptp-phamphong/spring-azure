package com.aptech.Dao;

import java.sql.*;
import java.util.ArrayList;

import com.aptech.Model.*;

public class StaffDao {
	private UtilDb utilDb;

	public StaffDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}
	
	public ArrayList<Staff> getAll() {
		ArrayList<Staff> list = new ArrayList<Staff>();

		String query = "SELECT * FROM Staff";
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Staff item = new Staff();
				item.setId(rs.getInt("Id"));
				item.setFullName(rs.getString("FullName"));
				item.setUsername(rs.getString("Username"));
				item.setEmail(rs.getString("Email"));
				item.setPassword(rs.getString("Password"));
				item.setAddress(rs.getString("Address"));
				item.setPhoneNumber(rs.getString("PhoneNumber"));
				item.setGender(rs.getBoolean("Gender"));
				item.setIsAdmin(rs.getBoolean("isAdmin"));
				item.setStatus(rs.getBoolean("Status"));
        		
				list.add(item);
			}
			return list;
		} catch (Exception ex) {
			System.out.print("abc");
		}
		return list;
	}
	
	public Staff getAccount(int id) {
		String sql = "SELECT * FROM Staff WHERE Id = " + id;
		Staff item = new Staff();
		try {
			Statement stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			
			if(rs.next()) {
				item.setId(rs.getInt("Id"));
				item.setFullName(rs.getString("FullName"));
				item.setUsername(rs.getString("Username"));
				item.setEmail(rs.getString("Email"));
				item.setPassword(rs.getString("Password"));
				item.setAddress(rs.getString("Address"));
				item.setPhoneNumber(rs.getString("PhoneNumber"));
				item.setGender(rs.getBoolean("Gender"));
				item.setIsAdmin(rs.getBoolean("isAdmin"));
				item.setStatus(rs.getBoolean("Status"));
				return item;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
	
	public Staff getAccountLogin(String username, String password) {
		Staff staff = new Staff();
		String query = "select * from Staff where Username= ? and Password = ?";
		
		try {
			PreparedStatement pre = utilDb.getConnection().prepareStatement(query);
			pre.setString(1, username);
			pre.setString(2, password);
			ResultSet rs = pre.executeQuery();
			if(rs.next()) {
				staff.setId(rs.getInt("Id"));
				staff.setGender(rs.getBoolean("Gender"));
				staff.setEmail(rs.getString("Email"));
				staff.setUsername(username);
				staff.setPassword(password);
				staff.setAddress(rs.getString("Address"));
				staff.setFullName(rs.getString("FullName"));
				staff.setPhoneNumber(rs.getString("PhoneNumber"));
				staff.setIsAdmin(rs.getBoolean("isAdmin"));
				staff.setStatus(rs.getBoolean("Status"));
				return staff;
			}
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
	
	public boolean turnOff(int id){
        String sql="update Staff set Status=0 where Id=?";
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
        String sql="update Staff set Status=1 where Id=?";
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
		String sql1 = "delete from Staff where Id=? and Status=0";
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
	
	public boolean edit(String name, String email, String phone, String address,int id){
        String sql="update Staff set FullName = ?, Email = ?, PhoneNumber = ?, Address = ? where Id=?";
        try{
            PreparedStatement pstm=utilDb.getConnection().prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setString(3, phone);
            pstm.setString(4, address);
            pstm.setInt(5, id);
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
	
	public boolean changePass(String pass, int id){
        String sql="update Staff set Password = ? where Id=?";
        try{
            PreparedStatement pstm=utilDb.getConnection().prepareStatement(sql);
            pstm.setString(1, pass);
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
