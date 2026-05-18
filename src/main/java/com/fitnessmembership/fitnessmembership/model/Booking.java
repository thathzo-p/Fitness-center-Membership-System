package com.fitnessmembership.fitnessmembership.model;

public class Booking {

    private String bookingId;
    private String userId;
    private String memberName;
    private String fitnessClass;
    private String date;
    private String timeSlot;
    private String status;


    public Booking() {}

    public Booking(String bookingId, String userId, String memberName, String fitnessClass, String date, String timeSlot, String status) {
        this.bookingId   = bookingId;
        this.userId      = userId;
        this.memberName  = memberName;
        this.fitnessClass = fitnessClass;
        this.date        = date;
        this.timeSlot    = timeSlot;
        this.status      = status;
    }


//getters and setters
    public String getBookingId() {
        return bookingId;
    }
    public void   setBookingId(String id) {
        this.bookingId = id;
    }

    public String getUserId(){
        return userId;
    }
    public void   setUserId(String userId) {
        this.userId = userId;
    }

    public String getMemberName() {
        return memberName;
    }
    public void   setMemberName(String name) {
        this.memberName = name;
    }

    public String getFitnessClass() {
        return fitnessClass;
    }
    public void   setFitnessClass(String fc)   {
        this.fitnessClass = fc;
    }

    public String getDate(){
        return date;
    }
    public void   setDate(String date)         {
        this.date = date;
    }

    public String getTimeSlot()                {
        return timeSlot;
    }
    public void   setTimeSlot(String slot)     {
        this.timeSlot = slot;
    }

    public String getStatus()                  {
        return status;
    }
    public void   setStatus(String status)     {
        this.status = status;
    }



    @Override
    public String toString() {
        return bookingId + "|" + userId + "|" + memberName + "|" + fitnessClass + "|" + date + "|" + timeSlot + "|" + status;
    }
}