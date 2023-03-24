package com.aptech.Dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.aptech.Model.Invoice;
import com.aptech.Model.InvoiceDetail;
import com.aptech.Model.ProductDetail;

public class InvoiceDetailDao {

	private UtilDb utilDb;

	public InvoiceDetailDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}

	public boolean addNew(InvoiceDetail invoiceDetail) {
		String query = "insert into InvoiceDetails (InvoiceId, ProductDetailsId, Quantity, Unit) values (?,?,?,?)";

		try {
			PreparedStatement pre = utilDb.getConnection().prepareStatement(query);
			pre.setInt(1, invoiceDetail.getInvoice().getId());
			pre.setInt(2, invoiceDetail.getProductDetail().getId());
			pre.setInt(3,invoiceDetail.getQuantity());
			pre.setInt(4, invoiceDetail.getUnit());
			
			int rs = pre.executeUpdate();
			if (rs != 0)
				return true;
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return false;
	}
	
	public ArrayList<InvoiceDetail> getByInvoiceId(int id){
		
		ArrayList<InvoiceDetail> list = new ArrayList<InvoiceDetail>();
		String query = "SELECT * FROM InvoiceDetails WHERE InvoiceId = " + id;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				InvoiceDetail item = new InvoiceDetail();
				item.setId(rs.getInt("id"));
				item.setQuantity(rs.getInt("quantity"));
				item.setUnit(rs.getInt("unit"));
				
				ProductDetailDao productDetailDao = new ProductDetailDao();
				item.setProductDetail(productDetailDao.getById(rs.getInt("ProductDetailsID")));
				
				
				list.add(item);
			}
			
		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		
		
		return list;
	}
	
	public boolean deleteByInvoiceId(int id) {
		String sql1 = "delete from InvoiceDetails where InvoiceId=?";
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
