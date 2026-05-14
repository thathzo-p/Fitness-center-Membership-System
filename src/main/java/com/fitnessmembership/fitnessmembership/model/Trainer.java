package com.fitnessmembership.fitnessmembership.model;

public class Trainer {

    private String id;
    private String name;
    private String specialty;
    private String experience;
    private String rating;
    private String clients;
    private String description;
    private String image;

    public Trainer() {}

    public Trainer(String id, String name, String specialty, String experience,
                   String rating, String clients, String description, String image) {
        this.id = id;
        this.name = name;
        this.specialty = specialty;
        this.experience = experience;
        this.rating = rating;
        this.clients = clients;
        this.description = description;
        this.image = image;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getSpecialty() { return specialty; }
    public String getExperience() { return experience; }
    public String getRating() { return rating; }
    public String getClients() { return clients; }
    public String getDescription() { return description; }
    public String getImage() { return image; }

    public void setId(String id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setSpecialty(String specialty) { this.specialty = specialty; }
    public void setExperience(String experience) { this.experience = experience; }
    public void setRating(String rating) { this.rating = rating; }
    public void setClients(String clients) { this.clients = clients; }
    public void setDescription(String description) { this.description = description; }
    public void setImage(String image) { this.image = image; }

    @Override
    public String toString() {
        return id + "," + name + "," + specialty + "," + experience + "," +
                rating + "," + clients + "," + description + "," + image;
    }
}