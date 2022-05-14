/**
 * Copyright 2022 UTE. All rights reserved.
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
 * Công việc Entity
 *
 * @author QuyenPM <1811505310235@sv.ute.udn.vn>
 * @since 0.0.1
 */
@Entity
@Table(name = "CongViec")
public class WorkEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaCongViec")
    private int id;
    
    @Column(name = "TenCongViec")
    private String name;
    
    @ManyToOne
    @JoinColumn(name = "MaNganhNge")
    private CareersEntity career;

    public WorkEntity() {
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

    public CareersEntity getCareer() {
        return career;
    }

    public void setCareer(CareersEntity career) {
        this.career = career;
    }
}
