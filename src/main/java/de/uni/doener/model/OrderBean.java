package de.uni.doener.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrderBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String customerName;
    private String street;
    private String houseNumber;
    private String postalCode;
    private String city;
    private String note;
    private String phone;
    private String deliveryType;
    private LocalDateTime createdAt;
    private BigDecimal totalAmount;
    private List<String> items;

    public OrderBean() {
        this.createdAt = LocalDateTime.now();
        this.totalAmount = BigDecimal.ZERO;
        this.items = new ArrayList<String>();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeliveryType() {
        return deliveryType;
    }

    public void setDeliveryType(String deliveryType) {
        this.deliveryType = deliveryType;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<String> getItems() {
        return items;
    }

    public void setItems(List<String> items) {
        this.items = items;
    }

    public String getDeliveryAddress() {
        return (street == null ? "" : street) + " " + (houseNumber == null ? "" : houseNumber)
                + ", " + (postalCode == null ? "" : postalCode) + " " + (city == null ? "" : city);
    }
}

