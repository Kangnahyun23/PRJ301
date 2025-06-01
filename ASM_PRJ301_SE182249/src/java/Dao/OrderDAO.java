/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.OrdersDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class OrderDAO {

    private static final String INSERT = "INSERT INTO Orders VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE = "UPDATE Orders SET shippedDate=?,freight=?,totalPrice=? WHERE orderId=?";
    private static final String SELECTALL = "SELECT * FROM Orders";
    private static final String SELECTBYUSERID = "SELECT * FROM Orders where accountId = ?";
    private static final String REPORT = "SELECT * FROM Orders where orderDate between ? and ? ORDER BY totalPrice DESC";

    public List<OrdersDTO> getListOrders() throws SQLException {
        List<OrdersDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECTALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderId = rs.getString("orderId");
                    int accountId = rs.getInt("accountId");
                    String fullName = rs.getString("fullName");
                    String orderDate = rs.getString("orderDate");
                    String shippedDate = rs.getString("shippedDate");
                    double freight = rs.getDouble("freight");
                    String shipAddress = rs.getString("shipAddress");
                    String phone = rs.getString("phone");
                    double totalPrice = rs.getDouble("totalPrice");
                    list.add(new OrdersDTO(orderId, accountId, fullName, orderDate, shippedDate, freight, shipAddress, phone, totalPrice));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<OrdersDTO> getListOrdersByAccount(int search) throws SQLException {
        List<OrdersDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECTBYUSERID);
                ptm.setInt(1, search);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderId = rs.getString("orderId");
                    int accountId = rs.getInt("accountId");
                    String fullName = rs.getString("fullName");
                    String orderDate = rs.getString("orderDate");
                    String shippedDate = rs.getString("shippedDate");
                    double freight = rs.getDouble("freight");
                    String shipAddress = rs.getString("shipAddress");
                    String phone = rs.getString("phone");
                    double totalPrice = rs.getDouble("totalPrice");
                    list.add(new OrdersDTO(orderId, accountId, fullName, orderDate, shippedDate, freight, shipAddress, phone, totalPrice));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean insert(OrdersDTO order) throws ClassNotFoundException, SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, order.getOrderId());
                ptm.setInt(2, order.getAccountID());
                ptm.setString(3, order.getFullName());
                ptm.setString(4, order.getOrderDate());
                ptm.setString(5, order.getShippedDate());
                ptm.setDouble(6, order.getFreight());
                ptm.setString(7, order.getShipAddress());
                ptm.setString(8, order.getPhone());
                ptm.setDouble(9, order.getTotalPrice());
                checkInsert = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkInsert;
    }

    public boolean update(String shippedDate, double Freight, double totalPrice, String orderId) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, shippedDate);
                ptm.setDouble(2, Freight);
                ptm.setDouble(3, totalPrice);
                ptm.setString(4, orderId);
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkUpdate;
    }

    public List<OrdersDTO> reportOrder(String dateFrom, String dateTo) throws SQLException {
        List<OrdersDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REPORT);
                ptm.setString(1, dateFrom);
                ptm.setString(2, dateTo);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderId = rs.getString("orderId");
                    int accountId = rs.getInt("accountId");
                    String fullName = rs.getString("fullName");
                    String orderDate = rs.getString("orderDate");
                    String shippedDate = rs.getString("shippedDate");
                    double freight = rs.getDouble("freight");
                    String shipAddress = rs.getString("shipAddress");
                    String phone = rs.getString("phone");
                    double totalPrice = rs.getDouble("totalPrice");
                    list.add(new OrdersDTO(orderId, accountId, fullName, orderDate, shippedDate, freight, shipAddress, phone, totalPrice));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

}
