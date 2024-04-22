/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author HUNG VU
 */
public class OrderTable {

    @Override
    public String toString() {
        return "OrderTable{" + "order_id=" + order_id + ", cus_id=" + cus_id + ", order_date=" + order_date + ", status=" + status + ", total=" + total + '}';
    }

    private int order_id;
    private int cus_id;
    private Date order_date;
    private String status;
    private double total;

    public OrderTable() {
    }

    public OrderTable(int order_id, double total) {
        this.order_id = order_id;
        this.total = total;
    }

    public OrderTable(int order_id, int cus_id, Date order_date, String status, double total) {
        this.order_id = order_id;
        this.cus_id = cus_id;
        this.order_date = order_date;
        this.status = status;
        this.total = total;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

}
