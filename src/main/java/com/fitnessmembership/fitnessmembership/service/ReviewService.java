package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.fitnessmembership.model.Review;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ReviewService {

    private static final String FILE_PATH = "data/reviews.txt";

    public void addReview(String memberName, int rating, String comment) {

        String reviewId = "R" + UUID.randomUUID().toString().substring(0, 6);
        String date = LocalDate.now().toString();

        Review review = new Review(reviewId, memberName, rating, comment, date);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(review.toString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving review: " + e.getMessage());
        }
    }

    public List<Review> getAllReviews() {

        List<Review> reviews = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {

                String[] parts = line.split("\\|", 5);

                if (parts.length == 5) {
                    reviews.add(new Review(
                            parts[0],
                            parts[1],
                            Integer.parseInt(parts[2]),
                            parts[3],
                            parts[4]
                    ));
                }
            }

        } catch (IOException e) {
            System.out.println("Error reading reviews: " + e.getMessage());
        }

        return reviews;
    }

    public List<Review> getLatestReviews(int limit) {

        List<Review> allReviews = getAllReviews();
        List<Review> latestReviews = new ArrayList<>();

        for (int i = allReviews.size() - 1; i >= 0 && latestReviews.size() < limit; i--) {
            latestReviews.add(allReviews.get(i));
        }

        return latestReviews;
    }

    public void deleteReview(String reviewId) {

        List<Review> reviews = getAllReviews();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {

            for (Review r : reviews) {
                if (!r.getReviewId().equals(reviewId)) {
                    writer.write(r.toString());
                    writer.newLine();
                }
            }

        } catch (IOException e) {
            System.out.println("Error deleting review: " + e.getMessage());
        }
    }
}