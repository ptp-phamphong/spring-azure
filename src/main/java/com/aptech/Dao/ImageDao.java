package com.aptech.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.aptech.Model.Image;
import com.aptech.Model.ProductType;

public class ImageDao {

	private UtilDb utilDb;

	public ImageDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}

	public ArrayList<Image> getByIdProduct(int id) {
		ArrayList<Image> list = new ArrayList<Image>();

		String query = "SELECT * FROM Image WHERE ProductId = " + id;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Image item = new Image();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("Name"));
				list.add(item);
			}

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return list;
	}

	public boolean add(int productId, String name) {
		String query = "insert into Image(ProductId, Name) values(?,?)";
		try {
			PreparedStatement pstm = utilDb.getConnection().prepareStatement(query);
			pstm.setInt(1, productId);
			pstm.setString(2, name);
			int rs = pstm.executeUpdate();
			if (rs != 0) {
				return true;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

	public boolean delete(int id) {
		String sql1 = "delete from Image where ProductId=?";
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
