package com.fitnessmembership.fitnessmembership.model;

public class Plan {

    private String id;
    private String name;
    private String price;
    private String description;
    private String features;

    public Plan() {}

    public Plan(String id, String name, String price, String description, String features) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.features = features;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getPrice() { return price; }
    public String getDescription() { return description; }
    public String getFeatures() { return features; }

    public void setId(String id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setPrice(String price) { this.price = price; }
    public void setDescription(String description) { this.description = description; }
    public void setFeatures(String features) { this.features = features; }

    public String[] getFeatureList() {
        return features.split("\\|");
    }

    @Override
    public String toString() {
        return id + "," + name + "," + price + "," + description + "," + features;
    }
}