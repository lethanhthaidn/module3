package model;

import java.util.Date;

public class Customer {
    private String name;
    private Date birthDay;
    private String adress;
    private String picture;

    public Customer(){}

    public Customer(String name, Date birthDay, String adress, String picture) {
        this.name = name;
        this.birthDay = birthDay;
        this.adress = adress;
        this.picture = picture;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

}
