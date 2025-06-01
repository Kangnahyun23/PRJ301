/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.AccountDTO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    private static final String SELECTALL = "SELECT * FROM Account where type=2";
    private static final String UPDATE = "UPDATE Account set FullName = ? where AccountID = ?";
    private static final String CHANGEPASSWORD = "UPDATE Account set Password=? where AccountID = ?";

    public List<AccountDTO> getListAccounts() throws SQLException {
        List<AccountDTO> accList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECTALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int accountID = rs.getInt("AccountID");
                    String userName = rs.getString("userName");
                    String name = rs.getString("FullName");
                    int type = rs.getInt("Type");
                    AccountDTO account = new AccountDTO(accountID, userName, "***", name, type);
                    accList.add(account);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
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
        return accList;
    }

    public AccountDTO login(String UserName, String Password) throws SQLException {
        AccountDTO account = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT * FROM Account WHERE UserName = ? AND Password = ?");
                ptm.setString(1, UserName);
                ptm.setString(2, Password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int accountID = rs.getInt("AccountID");
                    String name = rs.getString("FullName");
                    int type = rs.getInt("Type");
                    account = new AccountDTO(accountID, UserName, Password, name, type);
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
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
        return account;
    }

    public boolean insertAccount(AccountDTO account) throws SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("INSERT INTO Account VALUES (?, ?, ?, ?)");
                ptm.setString(1, account.getUserName());
                ptm.setString(2, account.getPassword());
                ptm.setString(3, account.getFullName());
                ptm.setInt(4, account.getType());
                checkInsert = ptm.executeUpdate() > 0 ? true : false;
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
        return checkInsert;
    }
       public boolean updateInfo(AccountDTO user) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setInt(2, user.getAccountId());
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
    public boolean changePassword(AccountDTO user) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGEPASSWORD);
                ptm.setString(1, user.getPassword());
                ptm.setInt(2, user.getAccountId());
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
}
