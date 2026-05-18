package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.TrainerHire;
import com.fitnessmembership.fitnessmembership.service.TrainerHireService;
import com.fitnessmembership.fitnessmembership.model.Booking;
import com.fitnessmembership.fitnessmembership.model.UserManagement;
import com.fitnessmembership.fitnessmembership.service.BookingService;
import com.fitnessmembership.fitnessmembership.model.Payment;
import com.fitnessmembership.fitnessmembership.service.PaymentService;
import java.util.ArrayList;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/booking")
public class BookingController {

    private BookingService bookingService = new BookingService();
    private TrainerHireService trainerHireService = new TrainerHireService();
    private PaymentService paymentService = new PaymentService();

    @GetMapping("/my")
    public String myBookings(Model model, HttpSession session) {

        UserManagement user = (UserManagement) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/login";
        }

        List<Booking> bookings = bookingService.getAllBookings();

        List<TrainerHire> trainerHires = trainerHireService.getHiresByMemberId(user.getUserId());

        List<Payment> userPayments = paymentService.getPaymentsByUser(user.getUserId());

        List<Payment> approvedPlans = new ArrayList<>();

        for (Payment payment : userPayments) {

            boolean isPaid =
                    "Paid".equalsIgnoreCase(payment.getStatus());

            boolean isTrainerHire =
                    payment.getDescription().startsWith("Trainer Hire - ");

            if (isPaid && !isTrainerHire) {
                approvedPlans.add(payment);
            }
        }

        model.addAttribute("bookings", bookings);
        model.addAttribute("trainerHires", trainerHires);
        model.addAttribute("approvedPlans", approvedPlans);

        return "booking-my";
    }

    @GetMapping("/new")
    public String newBookingPage() {
        return "booking-new";
    }

    @PostMapping("/create")
    public String createBooking(@RequestParam String memberName, @RequestParam String fitnessClass, @RequestParam String date, @RequestParam String timeSlot, HttpSession session) {

        UserManagement user = (UserManagement) session.getAttribute("loggedUser");

        String userId = "GUEST";

        if (user != null) {
            userId = user.getUserId();
        }

        bookingService.createBooking(userId, memberName, fitnessClass, date, timeSlot);

        return "redirect:/booking/my";
    }

    @GetMapping("/edit/{bookingId}")
    public String editBookingPage(@PathVariable String bookingId, Model model) {

        Booking booking = bookingService.getBookingById(bookingId);
        model.addAttribute("booking", booking);

        return "booking-edit";
    }

    @PostMapping("/update")
    public String updateBooking(@RequestParam String bookingId, @RequestParam String fitnessClass, @RequestParam String date, @RequestParam String timeSlot) {

        bookingService.updateBooking(bookingId, fitnessClass, date, timeSlot);

        return "redirect:/booking/my";
    }

    @GetMapping("/cancel/{bookingId}")
    public String cancelBooking(@PathVariable String bookingId) {

        bookingService.cancelBooking(bookingId);

        return "redirect:/booking/my";
    }
}