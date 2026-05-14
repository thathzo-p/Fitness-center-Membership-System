package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.fitnessmembership.model.Booking;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class BookingService {

    private static final String FILE_PATH = "data/bookings.txt";

    public boolean createBooking(String userId, String memberName,
                                 String fitnessClass, String date, String timeSlot) {

        String bookingId = "BK" + LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));

        Booking booking = new Booking(
                bookingId,
                userId,
                memberName,
                fitnessClass,
                date,
                timeSlot,
                "CONFIRMED"
        );

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(booking.toString());
            writer.newLine();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getAllBookings() {

        List<Booking> bookings = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {

                String[] data = line.split("\\|");

                if (data.length == 7) {
                    bookings.add(new Booking(
                            data[0],
                            data[1],
                            data[2],
                            data[3],
                            data[4],
                            data[5],
                            data[6]
                    ));
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public Booking getBookingById(String bookingId) {

        for (Booking booking : getAllBookings()) {
            if (booking.getBookingId().equals(bookingId)) {
                return booking;
            }
        }

        return null;
    }

    public boolean updateBooking(String bookingId, String fitnessClass,
                                 String date, String timeSlot) {

        List<Booking> bookings = getAllBookings();
        boolean found = false;

        for (Booking b : bookings) {
            if (b.getBookingId().equals(bookingId)) {
                b.setFitnessClass(fitnessClass);
                b.setDate(date);
                b.setTimeSlot(timeSlot);
                found = true;
                break;
            }
        }

        if (found) {
            writeAllBookings(bookings);
        }

        return found;
    }

    public boolean cancelBooking(String bookingId) {

        List<Booking> bookings = getAllBookings();
        boolean found = false;

        for (Booking b : bookings) {
            if (b.getBookingId().equals(bookingId)) {
                b.setStatus("CANCELLED");
                found = true;
                break;
            }
        }

        if (found) {
            writeAllBookings(bookings);
        }

        return found;
    }

    private void writeAllBookings(List<Booking> bookings) {

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {

            for (Booking booking : bookings) {
                writer.write(booking.toString());
                writer.newLine();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}