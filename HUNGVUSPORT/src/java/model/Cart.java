/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HUNG VU
 */
public class Cart {

    @Override
    public String toString() {
        return "Cart{" + "items=" + items + '}';
    }

    private List<Items> items;

    public Cart() {
        items = new ArrayList<>();

    }

    public List<Items> getItems() {
        return items;
    }

    public int getQuantityById(int id) {
        return getItemsById(id).getQuantity();

    }

    private Items getItemsById(int id) {
        for (Items item : items) {
            if (item.getProduct().getProduct_id() == id) {
                return item;
            }
        }
        return null;

    }

    public void addItems(Items item) {
        if (getItemsById(item.getProduct().getProduct_id()) != null) {
            Items m = getItemsById(item.getProduct().getProduct_id());
            m.setQuantity(m.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }

    public void removeItems(int id) {
        if (getItemsById(id) != null) {
            items.remove(getItemsById(id));
        }
    }

    public double getTotal() {
        double t = 0;
        for (Items item : items) {
            t += (item.getQuantity() * item.getProduct().getPrice());
        }
        return t;
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product product : list) {
            if (product.getProduct_id() == id) {
                return product;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list, String userName) {
        items = new ArrayList<>();
        try {

            if (txt != null && txt.length() != 0) {//neu co ton tai gio hang 
                String[] s = txt.split("/");
                for (String string : s) {
                    String[] n = string.split(":");
                    String u = n[0];
                    if (userName.equalsIgnoreCase(u)) {
                        int id = Integer.parseInt(n[1]);
                        int quantity = Integer.parseInt(n[2]);
                        Product p = getProductById(id, list);
                        Items t = new Items(p, quantity, p.getPrice());//tang gia len hai lan
                        addItems(t);
                    }
                }
            }
        } catch (NumberFormatException ex) {
        }
    }
}
