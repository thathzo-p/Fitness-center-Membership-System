package com.fitnessmembership.fitnessmembership.servlet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("username", "John");
        model.addAttribute("email", "john@email.com");
        model.addAttribute("membership", "Gold");
        model.addAttribute("expiryDate", "Dec 2025");
        model.addAttribute("gymDays", 18);
        model.addAttribute("scheduledDays", 26);
        model.addAttribute("nextPayment", 49);
        model.addAttribute("paymentDueDate", "Jan 1, 2026");
        return "dashboard";
    }
}