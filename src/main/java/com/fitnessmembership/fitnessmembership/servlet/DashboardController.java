package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private ReviewService reviewService = new ReviewService();

    @GetMapping("/dashboard")
    public String dashboard(Model model){

        model.addAttribute(
                "latestReviews",
                reviewService.getLatestReviews(3)
        );

        return "dashboard";
    }
}