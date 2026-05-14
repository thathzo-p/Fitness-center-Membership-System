package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.fitnessmembership.model.Trainer;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class TrainerService {

    private static final String FILE_PATH = "data/trainers.txt";

    public List<Trainer> getAllTrainers() {

        List<Trainer> trainers = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {

                String[] data = line.split(",");

                if (data.length == 8) {
                    trainers.add(new Trainer(
                            data[0], data[1], data[2], data[3],
                            data[4], data[5], data[6], data[7]
                    ));
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return trainers;
    }

    public void addTrainer(Trainer trainer) {

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {

            writer.write(trainer.toString());
            writer.newLine();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}