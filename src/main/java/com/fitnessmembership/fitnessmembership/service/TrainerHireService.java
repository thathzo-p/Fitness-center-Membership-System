package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.fitnessmembership.model.TrainerHire;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class TrainerHireService {

    private static final String FILE_PATH = "data/trainer-hires.txt";

    public void hireTrainer(String memberId, String trainerName, String packageType) {

        String hireId = "H" + UUID.randomUUID().toString().substring(0, 6);

        String price = packageType.equals("Weekly") ? "100" : "250";

        TrainerHire hire = new TrainerHire(
                hireId,
                memberId,
                trainerName,
                packageType,
                price,
                "ACTIVE"
        );

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(hire.toString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error saving trainer hire: " + e.getMessage());
        }
    }

    public List<TrainerHire> getHiresByMemberId(String memberId) {

        List<TrainerHire> hires = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {

                String[] parts = line.split("\\|");

                if (parts.length == 6 && parts[1].equals(memberId)) {
                    hires.add(new TrainerHire(
                            parts[0], parts[1], parts[2],
                            parts[3], parts[4], parts[5]
                    ));
                }
            }

        } catch (IOException e) {
            System.out.println("Error reading trainer hires: " + e.getMessage());
        }

        return hires;
    }
}