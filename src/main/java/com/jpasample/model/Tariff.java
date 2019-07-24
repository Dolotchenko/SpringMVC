package com.jpasample.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Tariff {

    @Id
    @GeneratedValue
    @Column(name="TARIFF_ID")
    private long id;

    private String nameTariff;
    private long minSum;
    private long maxSum;
    private long interestRate;

    @ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    @JoinColumn(name = "ID_TL" )
    private TypeLoan typeLoan;

    @OneToMany(mappedBy="tariff",cascade={CascadeType.REMOVE },fetch = FetchType.EAGER)
    private List<Application> applications = new ArrayList<>();

    public Tariff() {
    }

    public Tariff( String nameTariff, long minSum, long maxSum, long interestRate,TypeLoan typeLoan) {
        this.nameTariff = nameTariff;
        this.minSum = minSum;
        this.maxSum = maxSum;
        this.interestRate = interestRate;
        this.typeLoan=typeLoan;
    }

    public List<Application> getApplications() {
        return applications;
    }

    public TypeLoan getTypeLoan() {
        return typeLoan;
    }

    public void setTypeLoan(TypeLoan typeLoan) {
        this.typeLoan = typeLoan;
    }

    public long getId() {
        return id;
    }

    public String getNameTariff() {
        return nameTariff;
    }

    public long getMinSum() {
        return minSum;
    }

    public long getMaxSum() {
        return maxSum;
    }

    public long getInterestRate() {
        return interestRate;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setNameTariff(String nameTariff) {
        this.nameTariff = nameTariff;
    }

    public void setMinSum(long minSum) {
        this.minSum = minSum;
    }

    public void setMaxSum(long maxSum) {
        this.maxSum = maxSum;
    }

    public void setInterestRate(long interestRate) {
        this.interestRate = interestRate;
    }

    public void setApplications(List<Application> applications) {
        this.applications = applications;
    }
}
