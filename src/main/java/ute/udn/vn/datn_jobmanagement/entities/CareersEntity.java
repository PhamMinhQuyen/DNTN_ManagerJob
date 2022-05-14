/**
 * Copyright 2022 UTE. All rights reserved.
 */
package ute.udn.vn.datn_jobmanagement.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Ngành nghề Entity
 *
 * @author QuyenPM <1811505310235@sv.ute.udn.vn>
 * @since 0.0.1
 */
@Entity
@Table(name = "NganhNghe")
public class CareersEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaNganhNghe")
    private int id;

    @Column(name = "TenNganhNge")
    private String name;

    @OneToMany(mappedBy = "careers", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<PostEntity> posts;
    
    @OneToMany(mappedBy = "careers", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<CandidateJobEntity> candidateJobs;

    public CareersEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<PostEntity> getPosts() {
        return posts;
    }

    public void setPosts(List<PostEntity> posts) {
        this.posts = posts;
    }

    public List<CandidateJobEntity> getCandidateJobs() {
        return candidateJobs;
    }

    public void setCandidateJobs(List<CandidateJobEntity> candidateJobs) {
        this.candidateJobs = candidateJobs;
    }
}
