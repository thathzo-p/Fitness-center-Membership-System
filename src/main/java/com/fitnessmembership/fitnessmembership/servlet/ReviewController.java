package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.Review;
import com.fitnessmembership.fitnessmembership.model.UserManagement;
import com.fitnessmembership.fitnessmembership.service.ReviewService;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

    private ReviewService reviewService = new ReviewService();

    @GetMapping
    public String viewReviews(Model model) {

        List<Review> reviews = reviewService.getAllReviews();

        model.addAttribute("reviews", reviews);

        return "reviews";
    }

    @GetMapping("/add")
    public String addReviewPage() {
        return "review-add";
    }

    @PostMapping("/add")
    public String addReview(@RequestParam int rating,
                            @RequestParam String comment,
                            HttpSession session) {

        UserManagement user =
                (UserManagement) session.getAttribute("loggedUser");

        String memberName = "Guest";

        if (user != null) {
            memberName = user.getFullName();
        }

        reviewService.addReview(memberName, rating, comment);

        return "redirect:/reviews";
    }

    @GetMapping("/delete/{id}")
    public String deleteReview(@PathVariable String id) {

        reviewService.deleteReview(id);

        return "redirect:/reviews";
    }
}