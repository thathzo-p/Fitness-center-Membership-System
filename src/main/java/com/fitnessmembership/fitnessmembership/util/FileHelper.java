package com.fitnessmembership.fitnessmembership.util;

import com.fitnessmembership.fitnessmembership.util.FileHelper;
import com.fitnessmembership.fitnessmembership.model.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHelper {

    private static final String FILE_PATH = "data/users.txt";

    public static List<User> readAllUsers() {
        List<User> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 5) {
                    users.add(new User(parts[0], parts[1], parts[2], parts[3], parts[4]));
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading users: " + e.getMessage());
        }
        return users;
    }

    public static void saveUser(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(user.getId() + "," + user.getUsername() + "," +
                    user.getEmail() + "," + user.getPassword() + "," + user.getRole());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving user: " + e.getMessage());
        }
    }

    public static User findByUsername(String username) {
        return readAllUsers().stream()
                .filter(u -> u.getUsername().equals(username))
                .findFirst()
                .orElse(null);
    }

    public static boolean usernameExists(String username) {
        return findByUsername(username) != null;
    }
}