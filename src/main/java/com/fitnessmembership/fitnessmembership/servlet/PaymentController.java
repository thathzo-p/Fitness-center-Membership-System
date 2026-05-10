package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.Payment;
import com.fitnessmembership.fitnessmembership.service.PaymentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/payments")
public class PaymentController {

    private PaymentService paymentService = new PaymentService();

    // READ — view all payments
    @GetMapping
    public String viewPayments(Model model) {
        List<Payment> payments = paymentService.getAllPayments();
        model.addAttribute("payments", payments);
        return "payment";
    }

    // CREATE — show add payment form
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("payment", new Payment());
        return "payment-add";
    }

    // CREATE — submit new payment
    @PostMapping("/add")
    public String addPayment(@RequestParam String userId, @RequestParam String amount, @RequestParam String description, @RequestParam String date) {
        paymentService.addPayment(userId, amount, description, date);
        return "redirect:/payments";
    }

    // UPDATE — show edit form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        Payment payment = paymentService.getPaymentById(id);
        model.addAttribute("payment", payment);
        return "payment-edit";
    }

    // UPDATE — submit edit form
    @PostMapping("/edit/{id}")
    public String updatePayment(@PathVariable String id, @RequestParam String amount, @RequestParam String description, @RequestParam String status) {
        paymentService.updatePayment(id, amount, description, status);
        return "redirect:/payments";
    }

    // DELETE — delete payment
    @GetMapping("/delete/{id}")
    public String deletePayment(@PathVariable String id) {
        paymentService.deletePayment(id);
        return "redirect:/payments";
    }
}