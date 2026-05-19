package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.Payment;
import com.fitnessmembership.fitnessmembership.service.TrainerHireService;
import com.fitnessmembership.fitnessmembership.model.Payment;
import com.fitnessmembership.fitnessmembership.model.UserManagement;
import com.fitnessmembership.fitnessmembership.service.PaymentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/payments")
public class AdminPaymentController {

    private PaymentService paymentService = new PaymentService();

    private boolean isAdmin(HttpSession session) {
        UserManagement user =
                (UserManagement) session.getAttribute("loggedUser");

        return user != null && "ADMIN".equalsIgnoreCase(user.getRole());
    }

    @GetMapping
    public String viewPayments(HttpSession session, Model model) {

        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        List<Payment> payments = paymentService.getAllPayments();

        model.addAttribute("payments", payments);

        return "admin-payments";
    }

    @GetMapping("/approve/{id}")
    public String approvePayment(@PathVariable String id,
                                 HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        Payment payment = paymentService.getPaymentById(id);

        paymentService.approvePayment(id);

        if (payment != null &&
                payment.getDescription().startsWith("Trainer Hire - ")) {

            String trainerName =
                    payment.getDescription().replace("Trainer Hire - ", "");

            TrainerHireService trainerHireService =
                    new TrainerHireService();

            trainerHireService.activateTrainerHire(
                    payment.getUserId(),
                    trainerName
            );
        }

        return "redirect:/admin/payments";
    }
}