package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private ReviewService reviewService = new ReviewService();

    @GetMapping("/")
    public String home(Model model){

        model.addAttribute(
                "latestReviews",
                reviewService.getLatestReviews(4)
        );

        return "home";
    }
}