package com.fitnessmembership.fitnessmembership.model;

public class Payment {

    private String id;
    private String userId; // this will generate by the system
    private String amount;
    private String description;
    private String date;
    private String status; // Paid or Pending

    public Payment () {
    }


    public Payment (String id, String userId, String amount, String description, String date, String status) {

        this.id = id;
        this.userId = userId;
        this.amount = amount;
        this.description = description;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters
    public String getId () {
        return id;
    }

    public void setId (String id) {
        this.id = id;
    }

    public String getUserId () {
        return userId;
    }

    public void setUserId (String userId) {
        this.userId = userId;
    }

    public String getAmount () {
        return amount;
    }

    public void setAmount (String amount) {
        this.amount = amount;
    }

    public String getDescription () {
        return description;
    }

    public void setDescription (String description) {
        this.description = description;
    }

    public String getDate () {
        return date;
    }

    public void setDate (String date) {
        this.date = date;
    }

    public String getStatus () {
        return status;
    }

    public void setStatus (String status) {
        this.status = status;
    }
}
