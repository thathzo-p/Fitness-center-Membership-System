package com.fitnessmembership.fitnessmembership.model;

public class UserManagement {

    private String userId;
    private String fullName;
    private String username;
    private String birthday;
    private String email;
    private String countryCode;
    private String phone;
    private String gender;
    private String password;
    private String role;

    public UserManagement() {}


    public UserManagement(String userId, String fullName, String username,
                          String birthday, String email, String countryCode,
                          String phone, String gender, String password,
                          String role) {
        this.userId = userId;
        this.fullName = fullName;
        this.username = username;
        this.birthday = birthday;
        this.email = email;
        this.countryCode = countryCode;
        this.phone = phone;
        this.gender = gender;
        this.password = password;
        this.role = role;
    }


    public String getUserId() { return userId; }
    public String getFullName() { return fullName; }
    public String getUsername() { return username; }
    public String getBirthday() { return birthday; }
    public String getEmail() { return email; }
    public String getCountryCode() { return countryCode; }
    public String getPhone() { return phone; }
    public String getGender() { return gender; }
    public String getPassword() { return password; }
    public String getRole() { return role; }

    public void setUserId(String userId) { this.userId = userId; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public void setUsername(String username) { this.username = username; }
    public void setBirthday(String birthday) { this.birthday = birthday; }
    public void setEmail(String email) { this.email = email; }
    public void setCountryCode(String countryCode) { this.countryCode = countryCode; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setGender(String gender) { this.gender = gender; }
    public void setPassword(String password) { this.password = password; }
    public void setRole(String role) { this.role = role; }

    @Override
    public String toString() {
        return userId + "," + fullName + "," + username + "," + birthday + "," +
                email + "," + countryCode + "," + phone + "," + gender + "," +
                password + "," + role;
    }

}