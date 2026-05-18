package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.fitnessmembership.model.Payment;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class PaymentService {

    private static final String FILE_PATH = "data/payments.txt"; // store data in the text file

    // CREATE — add new payment
    public void addPayment(String userId, String amount, String description, String date) {
        String id = UUID.randomUUID().toString().substring(0, 8);
        Payment payment = new Payment(id, userId, amount, description, date, "Pending");
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(payment.getId() + "," + payment.getUserId() + "," + payment.getAmount() + "," + payment.getDescription() + "," + payment.getDate() + "," + payment.getStatus());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving payment: " + e.getMessage());
        }
    }

    // READ — get all payments
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
                    payments.add(new Payment(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5]));
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading payments: " + e.getMessage());
        }
        return payments;
    }

    // READ — get payments by user
    public List<Payment> getPaymentsByUser(String userId) {
        List<Payment> userPayments = new ArrayList<>();
        for (Payment p : getAllPayments()) {
            if (p.getUserId().equals(userId)) {
                userPayments.add(p);
            }
        }
        return userPayments;
    }

    // READ — get single payment by id
    public Payment getPaymentById(String id) {
        for (Payment p : getAllPayments()) {
            if (p.getId().equals(id)) {
                return p;
            }
        }
        return null;
    }

    // UPDATE — update payment status
    public void updatePayment(String id, String amount, String description, String status) {
        List<Payment> payments = getAllPayments();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Payment p : payments) {
                if (p.getId().equals(id)) {
                    p.setAmount(amount);
                    p.setDescription(description);
                    p.setStatus(status);
                }
                writer.write(p.getId() + "," + p.getUserId() + "," + p.getAmount() + "," + p.getDescription() + "," + p.getDate() + "," + p.getStatus());
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error updating payment: " + e.getMessage());
        }
    }

    // APPROVE — change payment status from Pending to Paid
    public void approvePayment(String id) {

        List<Payment> payments = getAllPayments();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {

            for (Payment p : payments) {

                if (p.getId().equals(id)) {
                    p.setStatus("Paid");
                }

                writer.write(p.getId() + "," + p.getUserId() + "," + p.getAmount() + "," + p.getDescription() + "," + p.getDate() + "," + p.getStatus());
                writer.newLine();
            }

        } catch (IOException e) {
            System.out.println("Error approving payment: " + e.getMessage());
        }
    }

    // DELETE — remove payment by id
    public void deletePayment(String id) {
        List<Payment> payments = getAllPayments();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {
            for (Payment p : payments) {
                if (!p.getId().equals(id)) {
                    writer.write(p.getId() + "," + p.getUserId() + "," + p.getAmount() + "," + p.getDescription() + "," + p.getDate() + "," + p.getStatus());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            System.out.println("Error deleting payment: " + e.getMessage());
        }
    }
}