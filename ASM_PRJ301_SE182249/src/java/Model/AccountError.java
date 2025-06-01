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
public class AccountError {

    private String UserName;
    private String password;
    private String confirm;
    private String FullName;
    private String Type;
    private String Address;
    private String Phone;
    public AccountError() {
        this.UserName = "";
        this.password = "";
        this.confirm = "";
        this.FullName = "";
        this.Type = "";
        this.Address = "";
        this.Phone = "";
    }
    public AccountError(String UserName, String password, String confirm, String FullName, String Type, String Address, String Phone) {
        this.UserName = UserName;
        this.password = password;
        this.confirm = confirm;
        this.FullName = FullName;
        this.Type = Type;
        this.Address = Address;
        this.Phone = Phone;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }
}
