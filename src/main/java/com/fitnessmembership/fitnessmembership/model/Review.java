package com.fitnessmembership.fitnessmembership.model;

public class Review {

    private String reviewId;
    private String memberName;
    private int rating;
    private String comment;
    private String date;

    public Review() {}

    public Review(String reviewId, String memberName, int rating, String comment, String date) {
        this.reviewId = reviewId;
        this.memberName = memberName;
        this.rating = rating;
        this.comment = comment;
        this.date = date;
    }

    public String getReviewId() {
        return reviewId;
    }

    public String getMemberName() {
        return memberName;
    }

    public int getRating() {
        return rating;
    }

    public String getComment() {
        return comment;
    }

    public String getDate() {
        return date;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return reviewId + "|" + memberName + "|" + rating + "|" + comment + "|" + date;
    }
}