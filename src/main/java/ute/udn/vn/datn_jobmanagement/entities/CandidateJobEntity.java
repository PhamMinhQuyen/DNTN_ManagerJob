/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.entities;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "CongViecUngVien")
public class CandidateJobEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaCVUV")
    private int id;

    @Column(name = "ViTriUngTuyen")
    private String appliedPosition;

    @Column(name = "CapBacMongMuon")
    private String rank;
    
    @Column(name = "LuongToiThieu")
    private String salaryMin;
    
    @Column(name = "LuongToiDa")
    private String salaryMax;
    
    @Column(name = "HinhThucLamViec")
    private String formOfWorking;
    
    @Column(name = "MucTieu")
    private String target;
    
    @ManyToOne
    @JoinColumn(name = "MaUV")
    private CandidateEntity candidate;
    
    @ManyToOne
    @JoinColumn(name = "MaNganhNghe")
    private CareersEntity careers;

    public CandidateJobEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAppliedPosition() {
        return appliedPosition;
    }

    public void setAppliedPosition(String appliedPosition) {
        this.appliedPosition = appliedPosition;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getSalaryMin() {
        return salaryMin;
    }

    public void setSalaryMin(String salaryMin) {
        this.salaryMin = salaryMin;
    }

    public String getSalaryMax() {
        return salaryMax;
    }

    public void setSalaryMax(String salaryMax) {
        this.salaryMax = salaryMax;
    }

    public String getFormOfWorking() {
        return formOfWorking;
    }

    public void setFormOfWorking(String formOfWorking) {
        this.formOfWorking = formOfWorking;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public CandidateEntity getCandidate() {
        return candidate;
    }

    public void setCandidate(CandidateEntity candidate) {
        this.candidate = candidate;
    }

    public CareersEntity getCareers() {
        return careers;
    }

    public void setCareers(CareersEntity careers) {
        this.careers = careers;
    }
}
