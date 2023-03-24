package com.aptech.Dao;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.aptech.Model.Customer;
import com.aptech.Model.Invoice;
import com.aptech.Model.ProductType;

public class InvoiceDao {
	private UtilDb utilDb;

	public InvoiceDao() {
		utilDb = new UtilDb();
		utilDb.connect();
	}

	public ArrayList<Invoice> getAll() {
		ArrayList<Invoice> list = new ArrayList<Invoice>();
		String query = "SELECT * FROM Invoice ";
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Invoice item = new Invoice();
				item.setId(rs.getInt("id"));
				item.setCreateDate(rs.getDate("CreateDate"));
				item.setTotalPrice(rs.getInt("TotalPrice"));

				StaffDao staffDao = new StaffDao();
				item.setStaff(staffDao.getAccount(rs.getInt("StaffId")));
				CustomerDao customerDao = new CustomerDao();
				item.setCustomer(customerDao.getAccount(rs.getInt("CustomerId")));

				InvoiceDetailDao invoiceDetailDao = new InvoiceDetailDao();
				item.setInvoiceDetails(invoiceDetailDao.getByInvoiceId(rs.getInt("id")));
				list.add(item);
			}

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return list;
	}

	public ArrayList<Invoice> getByCustomerId(int customerId) {
		ArrayList<Invoice> list = new ArrayList<Invoice>();
		String query = "SELECT * FROM Invoice WHERE CustomerId = " + customerId;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			while (rs.next()) {
				Invoice item = new Invoice();
				item.setId(rs.getInt("id"));
				item.setCreateDate(rs.getDate("CreateDate"));
				item.setTotalPrice(rs.getInt("TotalPrice"));

				item.setStaff(null);
				CustomerDao customerDao = new CustomerDao();
				item.setCustomer(customerDao.getAccount(rs.getInt("CustomerId")));

				InvoiceDetailDao invoiceDetailDao = new InvoiceDetailDao();
				item.setInvoiceDetails(invoiceDetailDao.getByInvoiceId(rs.getInt("id")));
				list.add(item);
			}

		} catch (Exception ex) {
			System.out.print(ex.getMessage());
		}

		return list;
	}

	public boolean addNew(Invoice invoice) {
		String query = "insert into Invoice (CustomerId, StaffId, CreateDate, TotalPrice) values (?,?,?,?)";

		try {
			PreparedStatement pre = utilDb.getConnection().prepareStatement(query);
			pre.setInt(1, invoice.getCustomer().getId());
			pre.setString(2, null);

			java.util.Date utilDate = invoice.getCreateDate();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			pre.setDate(3, sqlDate);
			pre.setInt(4, invoice.getTotalPrice());

			int rs = pre.executeUpdate();
			if (rs != 0)
				return true;
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return false;
	}

	public Invoice getLast() {
		String query = "SELECT TOP 1 * FROM Invoice ORDER BY id DESC ";
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				Invoice item = new Invoice();
				item.setId(rs.getInt("id"));
				item.setCreateDate(rs.getDate("CreateDate"));
				item.setTotalPrice(rs.getInt("TotalPrice"));

				item.setStaff(null);
				CustomerDao customerDao = new CustomerDao();
				item.setCustomer(customerDao.getAccount(rs.getInt("CustomerId")));
				return item;
			}

		} catch (Exception ex) {
		}

		return null;
	}

	public Invoice getById(int id) {
		String query = "SELECT * FROM Invoice WHERE Id =" + id;
		Statement stm;
		try {
			stm = utilDb.getConnection().createStatement();
			ResultSet rs = stm.executeQuery(query);
			if (rs.next()) {
				Invoice item = new Invoice();
				item.setId(rs.getInt("Id"));
				item.setCreateDate(rs.getDate("CreateDate"));
				item.setTotalPrice(rs.getInt("TotalPrice"));

				StaffDao staffDao = new StaffDao();
				item.setStaff(staffDao.getAccount(rs.getInt("StaffId")));
				CustomerDao customerDao = new CustomerDao();
				item.setCustomer(customerDao.getAccount(rs.getInt("CustomerId")));
				return item;
			}

		} catch (Exception ex) {
		}

		return null;
	}

	public boolean process(int staffId, int id) {
		String sql = "update Invoice set StaffId=? where Id=?";
		try {
			PreparedStatement pstm = utilDb.getConnection().prepareStatement(sql);
			pstm.setInt(1, staffId);
			pstm.setInt(2, id);
			int rs = pstm.executeUpdate();
			if (rs != 0) {
				return true;
			}
		} catch (SQLException ex) {
			System.out.print("abc");
		}
		return false;
	}
	
	public boolean delete(int id) {
		String sql1 = "delete from Invoice where Id=?";
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
