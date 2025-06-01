/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.CategoriesDTO;
import Model.ProductsDTO;
import Model.SuppliersDTO;
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
public class ProductDAO {

    private static final String SELECTALL = "SELECT p.*, c.CategoryName, c.Description, s.CompanyName FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID JOIN Suppliers s ON p.SupplierID = s.SupplierID";
    private static final String DELETE = "DELETE Products WHERE productId=?";
    private static final String UPDATE = "UPDATE Products SET quantity=?,unitPrice=? WHERE productId=?";
    private static final String INSERT = "INSERT INTO Products values (?,?,?,?,?,?)";
    private static final String SEARCHBYNAME = "SELECT p.*, c.CategoryName, c.Description, s.CompanyName FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID JOIN Suppliers s ON p.SupplierID = s.SupplierID WHERE ProductName like ?";
    private static final String SEARCHBYID = "SELECT p.*, c.CategoryName, c.Description, s.CompanyName FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID JOIN Suppliers s ON p.SupplierID = s.SupplierID WHERE ProductId= ?";
    private static final String SEARCHBYUNITPRICE = "SELECT p.*, c.CategoryName, c.Description, s.CompanyName FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID JOIN Suppliers s ON p.SupplierID = s.SupplierID WHERE UnitPrice= ?";
    private static final String SELECTQUANTITY = "select quantity from Products where productId = ?";

    public List<ProductsDTO> getListProduct() throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECTALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productId = rs.getInt("ProductId");
                    String productName = rs.getString("ProductName");
                    int supplierId = rs.getInt("SupplierId");
                    int categoryId = rs.getInt("CategoryId");
                    int quantity = rs.getInt("Quantity");
                    double unitPrice = rs.getDouble("UnitPrice");
                    String productImage = rs.getString("ProductImage");
                    String categoryName = rs.getString("CategoryName");
                    String categoryDescription = rs.getString("Description");
                    String companyName = rs.getString("CompanyName");
                    CategoriesDTO category = new CategoriesDTO(categoryId, categoryName, categoryDescription);
                    SuppliersDTO supplier = new SuppliersDTO();
                    supplier.setCompanyName(companyName);
                    ProductsDTO product = new ProductsDTO(productId, productName, supplierId, categoryId, unitPrice, productImage, quantity);
                    product.setCategory(category);
                    product.setSupplier(supplier);
                    list.add(product);
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

    public List<ProductsDTO> getListProductByID(int id) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHBYID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productId = rs.getInt("ProductId");
                    String productName = rs.getString("ProductName");
                    int supplierId = rs.getInt("SupplierId");
                    int categoryId = rs.getInt("CategoryId");
                    int quantity = rs.getInt("Quantity");
                    double unitPrice = rs.getDouble("UnitPrice");
                    String productImage = rs.getString("ProductImage");
                    String categoryName = rs.getString("CategoryName");
                    String categoryDescription = rs.getString("Description");
                    String companyName = rs.getString("CompanyName");
                    CategoriesDTO category = new CategoriesDTO(categoryId, categoryName, categoryDescription);
                    SuppliersDTO supplier = new SuppliersDTO();
                    supplier.setCompanyName(companyName);
                    ProductsDTO product = new ProductsDTO(productId, productName, supplierId, categoryId, unitPrice, productImage, quantity);
                    product.setCategory(category);
                    product.setSupplier(supplier);
                    list.add(product);
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

    public List<ProductsDTO> getListProductByName(String search) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHBYNAME);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productId = rs.getInt("ProductId");
                    String productName = rs.getString("ProductName");
                    int supplierId = rs.getInt("SupplierId");
                    int categoryId = rs.getInt("CategoryId");
                    int quantity = rs.getInt("Quantity");
                    double unitPrice = rs.getDouble("UnitPrice");
                    String productImage = rs.getString("ProductImage");
                    String categoryName = rs.getString("CategoryName");
                    String categoryDescription = rs.getString("Description");
                    String companyName = rs.getString("CompanyName");
                    CategoriesDTO category = new CategoriesDTO(categoryId, categoryName, categoryDescription);
                    SuppliersDTO supplier = new SuppliersDTO();
                    supplier.setCompanyName(companyName);
                    ProductsDTO product = new ProductsDTO(productId, productName, supplierId, categoryId, unitPrice, productImage, quantity);
                    product.setCategory(category);
                    product.setSupplier(supplier);
                    list.add(product);
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

    public List<ProductsDTO> getListProductByUnitPrice(double search) throws SQLException {
        List<ProductsDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCHBYUNITPRICE);
                ptm.setDouble(1, search);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productId = rs.getInt("ProductId");
                    String productName = rs.getString("ProductName");
                    int supplierId = rs.getInt("SupplierId");
                    int categoryId = rs.getInt("CategoryId");
                    int quantity = rs.getInt("Quantity");
                    double unitPrice = rs.getDouble("UnitPrice");
                    String productImage = rs.getString("ProductImage");
                    String categoryName = rs.getString("CategoryName");
                    String categoryDescription = rs.getString("Description");
                    String companyName = rs.getString("CompanyName");
                    CategoriesDTO category = new CategoriesDTO(categoryId, categoryName, categoryDescription);
                    SuppliersDTO supplier = new SuppliersDTO();
                    supplier.setCompanyName(companyName);
                    ProductsDTO product = new ProductsDTO(productId, productName, supplierId, categoryId, unitPrice, productImage, quantity);
                    product.setCategory(category);
                    product.setSupplier(supplier);
                    list.add(product);
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

    public boolean delete(int productId) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, productId);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
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
        return checkDelete;
    }

    public boolean update(ProductsDTO product) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setInt(1, product.getQuantity());
                ptm.setDouble(2, product.getUnitPrice());
                ptm.setInt(3, product.getProductId());
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

    public boolean insert(ProductsDTO product) throws ClassNotFoundException, SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getProductName());
                ptm.setInt(2, product.getSupplierId());
                ptm.setInt(3, product.getCategoryId());
                ptm.setInt(4, product.getQuantity());
                ptm.setDouble(5, product.getUnitPrice());
                ptm.setString(6, product.getProductImage());
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

    public int getProductQuantity(int productId) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECTQUANTITY);
                ptm.setInt(1, productId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    quantity = rs.getInt("quantity");
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
        return quantity;
    }
}
