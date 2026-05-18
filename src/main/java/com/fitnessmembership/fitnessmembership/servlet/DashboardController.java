package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.MemberProgress;
import com.fitnessmembership.fitnessmembership.model.UserManagement;
import com.fitnessmembership.fitnessmembership.service.MemberProgressService;
import com.fitnessmembership.fitnessmembership.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class DashboardController {

    private ReviewService reviewService = new ReviewService();
    private MemberProgressService progressService = new MemberProgressService();

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session){

        UserManagement user = (UserManagement) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/login";
        }

        List<MemberProgress> progressList = progressService.getProgressByMemberId(user.getUserId());
        MemberProgress latestProgress = null;

        if (progressList != null && !progressList.isEmpty()) {
            latestProgress = progressList.get(progressList.size() - 1);
        }

        model.addAttribute("latestReviews", reviewService.getLatestReviews(3));
        model.addAttribute("progressList", progressList);
        model.addAttribute("latestProgress", latestProgress);

        return "dashboard";
    }
}