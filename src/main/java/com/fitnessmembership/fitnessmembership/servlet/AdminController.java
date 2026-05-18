package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.UserManagement;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session) {

        UserManagement user =
                (UserManagement) session.getAttribute("loggedUser");

        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        return "admin-dashboard";
    }
}
