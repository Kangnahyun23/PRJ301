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
public class SuppliersDTO {

    private int SupplierId;
    private String CompanyName;
    private String Address;
    private String Phone;

    public SuppliersDTO() {
    }

    public SuppliersDTO(int SupplierId, String CompanyName, String Address, String Phone) {
        this.SupplierId = SupplierId;
        this.CompanyName = CompanyName;
        this.Address = Address;
        this.Phone = Phone;
    }

    public int getSupplierId() {
        return SupplierId;
    }

    public void setSupplierId(int SupplierId) {
        this.SupplierId = SupplierId;
    }

    public String getCompanyName() {
        return CompanyName;
    }

    public void setCompanyName(String CompanyName) {
        this.CompanyName = CompanyName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

}
