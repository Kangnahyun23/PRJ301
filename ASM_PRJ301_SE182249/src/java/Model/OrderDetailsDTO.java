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
public class OrderDetailsDTO {

    private String OrderId;
    private int ProductId;
    private double UnitPrice;
    private int Quantity;

    // Navigation properties
    private OrdersDTO order;
    private ProductsDTO product;

    public OrderDetailsDTO() {
    }

    public OrderDetailsDTO(String OrderId, int ProductId, double UnitPrice, int Quantity) {
        this.OrderId = OrderId;
        this.ProductId = ProductId;
        this.UnitPrice = UnitPrice;
        this.Quantity = Quantity;
    }

    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String OrderId) {
        this.OrderId = OrderId;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }

    public double getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(double UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public OrdersDTO getOrder() {
        return order;
    }

    public void setOrder(OrdersDTO order) {
        this.order = order;
    }

    public ProductsDTO getProduct() {
        return product;
    }

    public void setProduct(ProductsDTO product) {
        this.product = product;
    }

}
