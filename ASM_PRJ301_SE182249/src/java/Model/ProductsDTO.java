/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class ProductsDTO {

    private int ProductId;
    private String ProductName;
    private int SupplierId;
    private int CategoryId;
    private double UnitPrice;
    private String ProductImage;
    private int quantity;

    private SuppliersDTO supplier;
    private CategoriesDTO category;

    public ProductsDTO() {
    }

    public ProductsDTO(String ProductName, int SupplierId, int CategoryId, double UnitPrice, String ProductImage, int quantity) {
        this.ProductName = ProductName;
        this.SupplierId = SupplierId;
        this.CategoryId = CategoryId;
        this.UnitPrice = UnitPrice;
        this.ProductImage = ProductImage;
        this.quantity = quantity;
    }

    public ProductsDTO(int ProductId, String ProductName, int SupplierId, int CategoryId, double UnitPrice, String ProductImage, int quantity) {
        this.ProductId = ProductId;
        this.ProductName = ProductName;
        this.SupplierId = SupplierId;
        this.CategoryId = CategoryId;
        this.UnitPrice = UnitPrice;
        this.ProductImage = ProductImage;
        this.quantity = quantity;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getSupplierId() {
        return SupplierId;
    }

    public void setSupplierId(int SupplierId) {
        this.SupplierId = SupplierId;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }
    
    public SuppliersDTO getSupplier() {
        return supplier;
    }

    public void setSupplier(SuppliersDTO supplier) {
        this.supplier = supplier;
    }

    public CategoriesDTO getCategory() {
        return category;
    }

    public void setCategory(CategoriesDTO category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
