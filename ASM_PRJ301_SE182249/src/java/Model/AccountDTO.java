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
public class AccountDTO {

    private int AccountId;
    private String UserName;
    private String Password;
    private String FullName;
    private int Type;

    public AccountDTO() {
    }

    public AccountDTO(int AccountId, String UserName, String Password, String FullName, int Type) {
        this.AccountId = AccountId;
        this.UserName = UserName;
        this.Password = Password;
        this.FullName = FullName;
        this.Type = Type;
    }

    public int getAccountId() {
        return AccountId;
    }

    public void setAccountId(int AccountId) {
        this.AccountId = AccountId;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public int getType() {
        return Type;
    }

    public void setType(int Type) {
        this.Type = Type;
    }
}
