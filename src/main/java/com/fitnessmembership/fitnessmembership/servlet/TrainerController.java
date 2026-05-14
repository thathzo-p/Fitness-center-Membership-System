package com.fitnessmembership.fitnessmembership.servlet;

import com.fitnessmembership.fitnessmembership.model.Plan;
import com.fitnessmembership.fitnessmembership.model.Trainer;
import com.fitnessmembership.fitnessmembership.service.PlanService;
import com.fitnessmembership.fitnessmembership.service.TrainerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TrainerController {

    private TrainerService trainerService = new TrainerService();
    private PlanService planService = new PlanService();

    @GetMapping("/trainers")
    public String trainers(Model model) {
        model.addAttribute("trainers", trainerService.getAllTrainers());
        return "trainers";
    }

    @GetMapping("/plans")
    public String plans(Model model) {
        model.addAttribute("plans", planService.getAllPlans());
        return "plans";
    }

    @GetMapping("/trainer-add")
    public String trainerAdd() {
        return "trainer-add";
    }

    @PostMapping("/trainer-add")
    public String addTrainer(@RequestParam String id,
                             @RequestParam String name,
                             @RequestParam String specialty,
                             @RequestParam String experience,
                             @RequestParam String rating,
                             @RequestParam String clients,
                             @RequestParam String description,
                             @RequestParam String image) {

        Trainer trainer = new Trainer(
                id, name, specialty, experience,
                rating, clients, description, image
        );

        trainerService.addTrainer(trainer);

        return "redirect:/trainers";
    }

    @PostMapping("/plan-add")
    public String addPlan(@RequestParam String id,
                          @RequestParam String name,
                          @RequestParam String price,
                          @RequestParam String description,
                          @RequestParam String features) {

        Plan plan = new Plan(id, name, price, description, features);

        planService.addPlan(plan);

        return "redirect:/plans";
    }
}