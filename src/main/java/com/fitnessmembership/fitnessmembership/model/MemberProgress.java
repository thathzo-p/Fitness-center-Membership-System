package com.fitnessmembership.fitnessmembership.model;

public class MemberProgress {

    private String progressId;
    private String memberId;
    private String date;
    private double weight;
    private double height;
    private int gymDays;
    private double bmi;
    private String notes;

    public MemberProgress() {}

    public MemberProgress(String progressId, String memberId, String date,
                          double weight, double height, int gymDays, String notes) {
        this.progressId = progressId;
        this.memberId = memberId;
        this.date = date;
        this.weight = weight;  //current weight of the user
        this.height = height;
        this.gymDays = gymDays;
        this.bmi = calculateBMI(weight, height);
        this.notes = notes;
    }

    private double calculateBMI(double weight, double heightCm) {
        double heightM = heightCm / 100;
        return Math.round((weight / (heightM * heightM)) * 100.0) / 100.0;
    }

    public String getProgressId() {
        return progressId;
    }
    public String getMemberId() {
        return memberId;
    }
    public String getDate() {
        return date;
    }
    public double getWeight() {
        return weight;
    }
    public double getHeight() {//height of the user
        return height;
    }
    public int getGymDays() {
        return gymDays;
    }
    public double getBmi() {
        return bmi;
    }
    public String getNotes() {
        return notes;
    }

    public void setProgressId(String progressId) {
        this.progressId = progressId;
    }
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public void setWeight(double weight) {
        this.weight = weight;
    }
    public void setHeight(double height) {
        this.height = height;
    }
    public void setGymDays(int gymDays) {
        this.gymDays = gymDays;
    }
    public void setBmi(double bmi) {
        this.bmi = bmi;
    }
    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return progressId + "," + memberId + "," + date + "," +
                weight + "," + height + "," + gymDays + "," + bmi + "," + notes;
    }
}