package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.MemberProgress;
import com.fitnessmembership.fitnessmembership.model.UserManagement;
import com.fitnessmembership.fitnessmembership.service.MemberProgressService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/progress")
public class MemberProgressController {

    private MemberProgressService progressService = new MemberProgressService();

    @GetMapping
    public String viewMyProgress(HttpSession session, Model model) {

        UserManagement user = (UserManagement) session.getAttribute("loggedUser");

        String memberId = "GUEST";

        if (user != null) {
            memberId = user.getUserId();
        }

        List<MemberProgress> progressList = progressService.getProgressByMemberId(memberId);

        model.addAttribute("progressList", progressList);
        model.addAttribute("memberId", memberId);

        return "progress";
    }

    @GetMapping("/add")
    public String showAddProgressForm() {
        return "progress-add";
    }

    @PostMapping("/add")
    public String addProgress(@RequestParam String date, @RequestParam double weight, @RequestParam double height, @RequestParam int gymDays, @RequestParam String notes, HttpSession session) {

        UserManagement user =
                (UserManagement) session.getAttribute("loggedUser");

        String memberId = "GUEST";

        if (user != null) {
            memberId = user.getUserId();
        }

        progressService.addProgress(memberId, date, weight, height, gymDays, notes);

        return "redirect:/progress";
    }

    @GetMapping("/edit/{id}")
    public String showEditProgressForm(@PathVariable String id,
                                       Model model) {

        MemberProgress progress =
                progressService.getProgressById(id);

        model.addAttribute("progress", progress);

        return "progress-edit";
    }

    @PostMapping("/edit")
    public String updateProgress(@RequestParam String progressId, @RequestParam String date, @RequestParam double weight, @RequestParam double height, @RequestParam int gymDays, @RequestParam String notes, HttpSession session) {

        UserManagement user =
                (UserManagement) session.getAttribute("loggedUser");

        String memberId = "GUEST";

        if (user != null) {
            memberId = user.getUserId();
        }

        progressService.updateProgress(progressId, memberId, date, weight, height, gymDays, notes);

        return "redirect:/progress";
    }

    @GetMapping("/delete/{id}")
    public String deleteProgress(@PathVariable String id) {

        progressService.deleteProgress(id);

        return "redirect:/progress";
    }
}