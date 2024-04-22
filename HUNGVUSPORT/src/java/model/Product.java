/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HUNG VU
 */
public class Product {
    /*CREATE TABLE Product (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(255),
    description NVARCHAR(255),
    category_id INT,
    price DECIMAL(10, 2),
    quantity_available INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);*/
    
    private String img;
    
    private int product_id;
    private String product_name;
    private String description;
    private double price;
    private int quantity;
    private Category category;

    public Product() {
    }

    public Product(String img, int product_id, String product_name, String description, double price, int quantity) {
        this.img = img;
        this.product_id = product_id;
        this.product_name = product_name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
    }

    public Product(String img, int product_id, String product_name, String description, double price, int quantity, Category category) {
        this.img = img;
        this.product_id = product_id;
        this.product_name = product_name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
    }

    public Product(String img, String prodduct_name, String description, double price, int quantity, Category category) {
        this.img = img;
   
        this.product_name = prodduct_name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
    }

    public Product(String product_name, double price) {
        this.product_name = product_name;
        this.price = price;
    }

    
    
    

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String prodduct_name) {
        this.product_name = prodduct_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "img=" + img + ", product_id=" + product_id + ", prodduct_name=" + product_name + ", description=" + description + ", price=" + price + ", quantity=" + quantity + '}';
    }

   
}
