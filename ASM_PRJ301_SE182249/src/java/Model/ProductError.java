/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author PC
 */
public class ProductError {
    private String ProductId;
    private String ProductName;
    private String SupplierId;
    private String CategoryId;
    private String Quantity;
    private String UnitPrice;
    private String ProductImage;

    public ProductError() {
        this.ProductId = "";
        this.ProductName = "";
        this.SupplierId = "";
        this.CategoryId = "";
        this.Quantity = "";
        this.UnitPrice = "";
        this.ProductImage = "";
    }

    public ProductError(String ProductId, String ProductName, String SupplierId, String CategoryId, String Quantity, String UnitPrice, String ProductImage) {
        this.ProductId = ProductId;
        this.ProductName = ProductName;
        this.SupplierId = SupplierId;
        this.CategoryId = CategoryId;
        this.Quantity = Quantity;
        this.UnitPrice = UnitPrice;
        this.ProductImage = ProductImage;
    }

    public String getProductId() {
        return ProductId;
    }

    public void setProductId(String ProductId) {
        this.ProductId = ProductId;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getSupplierId() {
        return SupplierId;
    }

    public void setSupplierId(String SupplierId) {
        this.SupplierId = SupplierId;
    }

    public String getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(String CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getQuantity() {
        return Quantity;
    }

    public void setQuantity(String Quantity) {
        this.Quantity = Quantity;
    }

    public String getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(String UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }
}
