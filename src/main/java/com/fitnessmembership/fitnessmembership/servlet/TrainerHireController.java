package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.UserManagement;
import com.fitnessmembership.fitnessmembership.service.TrainerHireService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/trainer-hire")
public class TrainerHireController {

    private TrainerHireService hireService = new TrainerHireService();

    @PostMapping("/hire")
    public String hireTrainer(@RequestParam String trainerName,
                              @RequestParam String packageType,
                              HttpSession session) {

        UserManagement user =
                (UserManagement) session.getAttribute("loggedUser");

        String memberId = "GUEST";

        if (user != null) {
            memberId = user.getUserId();
        }

        hireService.hireTrainer(memberId, trainerName, packageType);

        String amount = packageType.equals("Weekly") ? "100" : "250";

        return "redirect:/payments/portal?plan=Trainer Hire - "
                + trainerName
                + "&amount="
                + amount;
    }
}