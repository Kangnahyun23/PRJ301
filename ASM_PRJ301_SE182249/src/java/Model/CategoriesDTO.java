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
public class CategoriesDTO {

    private int CategoryId;
    private String CategoryName;
    private String Description;

    public CategoriesDTO() {
    }

    public CategoriesDTO(int CategoryId, String CategoryName, String Description) {
        this.CategoryId = CategoryId;
        this.CategoryName = CategoryName;
        this.Description = Description;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

}
