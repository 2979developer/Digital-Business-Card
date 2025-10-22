package com.org;

public class Card {
    private int id;
    private int userId;
    private String cardTitle;
    private String cardDesign;
    private String fullName;
    private String jobTitle;
    private String phone;
    private String email;
    private String website;

    // ✅ Default Constructor (required for JSP/Servlets frameworks)
    public Card() {}

    // ✅ Parameterized Constructor (optional if you want quick initialization)
    public Card(int id, int userId, String cardTitle, String cardDesign, 
                String fullName, String jobTitle, String phone, 
                String email, String website) {
        this.id = id;
        this.userId = userId;
        this.cardTitle = cardTitle;
        this.cardDesign = cardDesign;
        this.fullName = fullName;
        this.jobTitle = jobTitle;
        this.phone = phone;
        this.email = email;
        this.website = website;
    }

    // ✅ Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getCardTitle() { return cardTitle; }
    public void setCardTitle(String cardTitle) { this.cardTitle = cardTitle; }

    public String getCardDesign() { return cardDesign; }
    public void setCardDesign(String cardDesign) { this.cardDesign = cardDesign; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }
}
