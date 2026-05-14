package com.fitnessmembership.fitnessmembership.service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserManagementService {

    private static final String FILE_PATH = "data/user-management.txt";

    // Add User
    public void addUser(UserManagement user) {

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {

            writer.write(user.toString());
            writer.newLine();

            System.out.println("User added successfully!");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // View All Users
    public List<UserManagement> getAllUsers() {

        List<UserManagement> users = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {

                String[] data = line.split(",");

                if (data.length == 10) {

                    UserManagement user = new UserManagement(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9]);

                    users.add(user);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Delete User
    public void deleteUser(String userId) {

        List<UserManagement> users = getAllUsers();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {

            for (UserManagement user : users) {

                if (!user.getUserId().equals(userId)) {

                    writer.write(user.toString());
                    writer.newLine();
                }
            }

            System.out.println("User deleted successfully!");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public UserManagement login(String username, String password) {

        for (UserManagement user : getAllUsers()) {

            if (user.getUsername().equals(username)
                    && user.getPassword().equals(password)) {

                return user;
            }
        }

        return null;
    }
}