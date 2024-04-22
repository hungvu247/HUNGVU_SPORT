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
public class Review {

    /*CREATE TABLE Review (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    comment TEXT,
    review_date DATETIME,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Users(user_id)
);*/
    private String review_id;
    private int product_id;
    private int customer_id;
    private String comment;
    private Date reviewDate;

    public Review(int product_id, int customer_id, String comment, Date reviewDate) {
        this.product_id = product_id;
        this.customer_id = customer_id;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }

    public Review(String review_id, int product_id, int customer_id, String comment, Date reviewDate) {
        this.review_id = review_id;
        this.product_id = product_id;
        this.customer_id = customer_id;
      
        this.comment = comment;
        this.reviewDate = reviewDate;
    }

    public Review() {
    }

    public String getReview_id() {
        return review_id;
    }

    public void setReview_id(String review_id) {
        this.review_id = review_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

 

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    @Override
    public String toString() {
        return "Review{" + "review_id=" + review_id + ", product_id=" + product_id + ", customer_id=" + customer_id + ", comment=" + comment + ", reviewDate=" + reviewDate + '}';
    }

}
