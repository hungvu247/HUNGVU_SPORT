package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author HUNG VU
 */
public class Orderdetail {
    private String oid,pid;
    private int quantity;
    private double price;

    public Orderdetail(String pid, int quantity) {
        this.pid = pid;
        this.quantity = quantity;
    }

    
    public Orderdetail(String oid, String pid, int quantity, double price) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.price = price;
    }

    public Orderdetail() {
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Orderdetail{" + "oid=" + oid + ", pid=" + pid + ", quantity=" + quantity + ", price=" + price + '}';
    }
    

   
  
}
