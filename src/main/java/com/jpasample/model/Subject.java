package com.jpasample.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Subject {
    @Id
    @GeneratedValue
    private long id;

    private String FIO;
    private String birthDay;
    private int pasportSeria;
    private int pasportNumber;

    @ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    @JoinColumn(name = "REGION_ID" )
    private Region region;

    @OneToMany(mappedBy="subject",cascade={CascadeType.REMOVE },fetch = FetchType.EAGER)
    private List<Application> applications = new ArrayList<>();

    public Subject() {
    }



    public Subject(String FIO, String birthDay, int pasportSeria, int pasportNumber, Region region) {
        this.FIO = FIO;
        this.birthDay = birthDay;
        this.pasportSeria = pasportSeria;
        this.pasportNumber = pasportNumber;
        this.region=region;
    }

    public long getId() {
        return id;
    }

    public List<Application> getApplications() {
        return applications;
    }

    public String getFIO() {
        return FIO;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public long getPasportSeria() {
        return pasportSeria;
    }

    public long getPasportNumber() {
        return pasportNumber;
    }
    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setApplications(List<Application> applications) {
        this.applications = applications;
    }

    public void setFIO(String FIO) {
        this.FIO = FIO;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public void setPasportSeria(int pasportSeria) {
        this.pasportSeria = pasportSeria;
    }

    public void setPasportNumber(int pasportNumber) {
        this.pasportNumber = pasportNumber;
    }
}
