package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.fitnessmembership.model.Plan;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PlanService {

    private static final String FILE_PATH = "data/plans.txt";

    public List<Plan> getAllPlans() {

        List<Plan> plans = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {

                String[] data = line.split(",");

                if (data.length == 5) {
                    plans.add(new Plan(
                            data[0], data[1], data[2], data[3], data[4]
                    ));
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return plans;
    }

    public void addPlan(Plan plan) {

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {

            writer.write(plan.toString());
            writer.newLine();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}