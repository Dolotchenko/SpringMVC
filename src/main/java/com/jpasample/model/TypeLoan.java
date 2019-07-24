package com.jpasample.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class TypeLoan {
    @Id
    @GeneratedValue
    @Column(name="TYPELOAN_ID")
    private long id;


    @OneToMany(mappedBy="typeLoan",cascade={CascadeType.PERSIST },fetch = FetchType.EAGER)
    private List<Tariff> tariffs = new ArrayList<>();

    private String loanName;

    public TypeLoan(String loanName) {
        this.loanName = loanName;
    }

    public TypeLoan() {
    }

    public List<Tariff> getTariffs() {
        return tariffs;
    }

    public void setTariffs(List<Tariff> tariffs) {
        this.tariffs = tariffs;
    }

    public long getId() {
        return id;
    }

    public String getLoanName() {
        return loanName;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setLoanName(String loanName) {
        this.loanName = loanName;
    }

    @Override
    public String toString() {
        return super.toString()+" {" + "id=" + id + " regionName=" + loanName + '}';
    }

}
