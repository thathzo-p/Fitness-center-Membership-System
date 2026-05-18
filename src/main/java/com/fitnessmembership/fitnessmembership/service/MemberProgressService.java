package com.fitnessmembership.fitnessmembership.service;

import com.fitnessmembership.fitnessmembership.model.MemberProgress;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class MemberProgressService {

    private static final String FILE_PATH = "data/progress.txt"; //data storing

    public void addProgress(String memberId, String date, double weight, double height, int gymDays, String notes) {

        String progressId = UUID.randomUUID().toString().substring(0, 8);

        MemberProgress progress = new MemberProgress(progressId, memberId, date, weight, height, gymDays, notes);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {

            writer.write(progress.toString());
            writer.newLine();

        } catch (IOException e) {
            System.out.println("Error saving progress: " + e.getMessage());
        }
    }

    public List<MemberProgress> getAllProgress() {

        List<MemberProgress> progressList = new ArrayList<>();

        try (BufferedReader reader =
                     new BufferedReader(new FileReader(FILE_PATH))) {

            String line;

            while ((line = reader.readLine()) != null) {

                String[] parts = line.split(",", 8);

                if (parts.length == 8) {
                    MemberProgress progress = new MemberProgress();

                    progress.setProgressId(parts[0]);
                    progress.setMemberId(parts[1]);
                    progress.setDate(parts[2]);
                    progress.setWeight(Double.parseDouble(parts[3]));
                    progress.setHeight(Double.parseDouble(parts[4]));
                    progress.setGymDays(Integer.parseInt(parts[5]));
                    progress.setBmi(Double.parseDouble(parts[6]));
                    progress.setNotes(parts[7]);

                    progressList.add(progress);
                }
            }

        } catch (IOException e) {
            System.out.println("Error reading progress: " + e.getMessage());
        }

        return progressList;
    }

    public List<MemberProgress> getProgressByMemberId(String memberId) {

        List<MemberProgress> memberProgress = new ArrayList<>();

        for (MemberProgress p : getAllProgress()) {

            if (p.getMemberId().equals(memberId)) {
                memberProgress.add(p);
            }
        }

        return memberProgress;
    }

    public MemberProgress getProgressById(String progressId) {

        for (MemberProgress p : getAllProgress()) {

            if (p.getProgressId().equals(progressId)) {
                return p;
            }
        }

        return null;
    }

    public void updateProgress(String progressId, String memberId, String date, double weight, double height, int gymDays, String notes) {

        List<MemberProgress> progressList = getAllProgress();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {

            for (MemberProgress p : progressList) {

                if (p.getProgressId().equals(progressId)) {

                    MemberProgress updated = new MemberProgress(progressId, memberId, date, weight, height, gymDays, notes);

                    writer.write(updated.toString());

                } else {
                    writer.write(p.toString());
                }

                writer.newLine();
            }

        } catch (IOException e) {
            System.out.println("Error updating progress: " + e.getMessage());
        }
    }

    public void deleteProgress(String progressId) {

        List<MemberProgress> progressList = getAllProgress();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, false))) {

            for (MemberProgress p : progressList) {

                if (!p.getProgressId().equals(progressId)) {
                    writer.write(p.toString());
                    writer.newLine();
                }
            }

        } catch (IOException e) {
            System.out.println("Error deleting progress: " + e.getMessage());
        }
    }
}