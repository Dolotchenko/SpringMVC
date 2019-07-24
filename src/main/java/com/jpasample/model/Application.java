package com.jpasample.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.persistence.*;
import java.util.Date;


@Entity
public class Application {

    @Id
    @GeneratedValue
    private long id;

    private long amountMoney;
    private double overpaidAmount;
    private String loanDate;
    private long loanTerm;
    private double monthlyPayment;
    private String status;
    private String checkCI;

    @ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    @JsonIgnore
    @JoinColumn(name = "ID_TARIFF" )
    private Tariff tariff;

    @ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    @JsonIgnore
    @JoinColumn(name = "ID_SUBJECT" )
    private Subject subject;

    public Application(long amountMoney, long overpaidAmount, String loanDate,
                       long loanTerm, long monthlyPayment, String status, String checkCI, Tariff tariff,Subject subject) {
        this.amountMoney = amountMoney;
        this.overpaidAmount = overpaidAmount;
        this.loanDate = loanDate;
        this.loanTerm = loanTerm;
        this.monthlyPayment = monthlyPayment;
        this.status = status;
        this.checkCI = checkCI;
        this.tariff=tariff;
        this.subject=subject;
    }

    public Application() {
    }

    public long getId() {
        return id;
    }

    public Tariff getTariff() {
        return tariff;
    }

    public Subject getSubject() {
        return subject;
    }

    public long getAmountMoney() {
        return amountMoney;
    }

    public double getOverpaidAmount() {
        return overpaidAmount;
    }

    public String getLoanDate() {
        return loanDate;
    }

    public long getLoanTerm() {
        return loanTerm;
    }

    public double getMonthlyPayment() {
        return monthlyPayment;
    }

    public String getStatus() {
        return status;
    }

    public String getCheckCI() {
        return checkCI;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCheckCI(String checkCI) {
        this.checkCI = checkCI;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setAmountMoney(long amountMoney) {
        this.amountMoney = amountMoney;
    }

    public void setOverpaidAmount(double overpaidAmount) {
        this.overpaidAmount = overpaidAmount;
    }

    public void setLoanDate(String loanDate) {
        this.loanDate = loanDate;
    }

    public void setLoanTerm(long loanTerm) {
        this.loanTerm = loanTerm;
    }

    public void setMonthlyPayment(double monthlyPayment) {
        this.monthlyPayment = monthlyPayment;
    }

    public void setTariff(Tariff tariff) {
        this.tariff = tariff;
    }
}
