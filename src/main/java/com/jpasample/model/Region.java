package com.jpasample.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Region")
@EntityListeners(EventMonitor.class)

public class Region {
    @Id
    @GeneratedValue
    @Column(name="REGION_ID")
    private long id;
    private String regionName;



//    @OneToMany(mappedBy="region",cascade={CascadeType.DETACH},fetch = FetchType.EAGER)
//    private List<Subject> subjects = new ArrayList<>();

    public Region(String regionName) {
        this.regionName = regionName;
    }
    public Region() {
    }


    public long getId() {
        return id;
    }

    public String getRegionName() {
        return regionName;
    }


//    public List<Subject> getSubjects() {
//        return subjects;
//    }

//    public void setSubjects(List<Subject> subjects) {
//        this.subjects = subjects;
//    }

    public void setId(long id) {
        this.id = id;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    @Override
    public String toString() {
        return super.toString()+" {" + "id=" + id + " regionName=" + regionName + '}';
    }
}
