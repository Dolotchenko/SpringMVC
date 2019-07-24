package com.jpasample.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class TypeSubject {

    @Id
    @GeneratedValue
    private long id;

   private String typeSubject;

    public TypeSubject(String typeSubject) {
        this.typeSubject = typeSubject;
    }

    public String getTypeSubject() {
        return typeSubject;
    }
    public TypeSubject() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setTypeSubject(String typeSubject) {
        this.typeSubject = typeSubject;
    }
}
