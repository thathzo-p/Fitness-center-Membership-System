package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.model.User;
import com.fitnessmembership.util.FileHelper;
import org.springframework.stereotype.Service;
import java.util.UUID;

@Service
public class AuthService {

    public User login(String username, String password) {
        User user = FileHelper.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public boolean register(String username, String email, String password) {
        if (FileHelper.usernameExists(username)) {
            return false; // username already taken
        }
        String id = UUID.randomUUID().toString();
        User newUser = new User(id, username, email, password, "MEMBER");
        FileHelper.saveUser(newUser);
        return true;
    }
}