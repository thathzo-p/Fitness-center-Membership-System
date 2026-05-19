package com.fitnessmembership.fitnessmembership.servlet;

import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import com.fitnessmembership.fitnessmembership.service.UserManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    private UserManagementService service = new UserManagementService();

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String username, @RequestParam String password, HttpSession session) {

        UserManagement user = service.login(username, password);

        if (user != null) {
            session.setAttribute("loggedUser", user);
            return "redirect:/dashboard";
        }

        return "redirect:/login";
    }

    @GetMapping("/signup")
    public String signupPage() {
        return "signup";
    }

    @GetMapping("/profile")
    public String profilePage(HttpSession session, Model model) {

        UserManagement user =
                (UserManagement) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user);

        return "profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/home";
    }

    @PostMapping("/signup")
    public String signupUser(@RequestParam String fullName, @RequestParam String username, @RequestParam String birthday, @RequestParam String email, @RequestParam String countryCode, @RequestParam String phone, @RequestParam String gender, @RequestParam String password) {

        String userId = "U" + System.currentTimeMillis();

        UserManagement user = new UserManagement(userId, fullName, username, birthday, email, countryCode, phone, gender, password, "MEMBER");

        service.addUser(user);

        return "redirect:/dashboard";
    }
}