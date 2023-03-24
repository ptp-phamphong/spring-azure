package com.aptech.Dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.aptech.Model.*;
import com.aptech.Model.Product;
import com.aptech.Model.Size;

public class SizeDao {

	private UtilDb utilDb;

	public SizeDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}

	public ArrayList<Size> getAll() {
		ArrayList<Size> list = new ArrayList<Size>();
		String sql = "Select * from Size";
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Size item = new Size();
				item.setId(rs.getInt("Id"));
				item.setName(rs.getString("Name"));
				list.add(item);
			}
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		return list;
	}
	
	public Size getById(int id) {

		String sql = "SELECT * FROM Size WHERE Id = " + id;
		try {
			Statement stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			if (rs.next()) {
				Size item = new Size();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				return item;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public ArrayList<Size> getByIdProduct(int ProductId) {
		ArrayList<Size> list = new ArrayList<Size>();
		String sql = "SELECT SizeId FROM ProductDetails WHERE ProductId = " + ProductId;
		try {
			Statement stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Size item = new Size();
				SizeDao sizeDao = new SizeDao();
				item = sizeDao.getById(rs.getInt("SizeId"));
				list.add(item);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
}
