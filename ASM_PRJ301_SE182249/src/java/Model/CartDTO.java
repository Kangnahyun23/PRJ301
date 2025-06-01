/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.HashMap;

/**
 *
 * @author PC
 */
public class CartDTO {

    private HashMap<Integer, ProductsDTO> cart;

    public CartDTO() {
    }

    public CartDTO(HashMap<Integer, ProductsDTO> cart) {
        this.cart = cart;
    }

    public HashMap<Integer, ProductsDTO> getCart() {
        return cart;
    }

    public void setCart(HashMap<Integer, ProductsDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductsDTO product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(product.getProductId())) {
                int currentQuantity = this.cart.get(product.getProductId()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getProductId(), product);
            check = true;
        } catch (Exception e) {
        }

        return check;
    }

    public boolean change(int id, ProductsDTO product) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, product);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(int id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public void removeAll() {
        cart.clear();
    }
}
