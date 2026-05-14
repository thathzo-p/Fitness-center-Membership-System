package com.fitnessmembership.fitnessmembership.model;

public class TrainerHire {

    private String hireId;
    private String memberId;
    private String trainerName;
    private String packageType;
    private String price;
    private String status;

    public TrainerHire() {}

    public TrainerHire(String hireId, String memberId, String trainerName,
                       String packageType, String price, String status) {
        this.hireId = hireId;
        this.memberId = memberId;
        this.trainerName = trainerName;
        this.packageType = packageType;
        this.price = price;
        this.status = status;
    }

    public String getHireId() { return hireId; }
    public String getMemberId() { return memberId; }
    public String getTrainerName() { return trainerName; }
    public String getPackageType() { return packageType; }
    public String getPrice() { return price; }
    public String getStatus() { return status; }

    public void setHireId(String hireId) { this.hireId = hireId; }
    public void setMemberId(String memberId) { this.memberId = memberId; }
    public void setTrainerName(String trainerName) { this.trainerName = trainerName; }
    public void setPackageType(String packageType) { this.packageType = packageType; }
    public void setPrice(String price) { this.price = price; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return hireId + "|" + memberId + "|" + trainerName + "|" +
                packageType + "|" + price + "|" + status;
    }
}