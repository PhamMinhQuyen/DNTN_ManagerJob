/**
 * Copyright 2022 UTE. All rights reserved.
 */
package ute.udn.vn.datn_jobmanagement.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;
import ute.udn.vn.datn_jobmanagement.enums.StatusEnum;

/**
 * Người dùng Entity
 *
 * @author QuyenPM <1811505310235@sv.ute.udn.vn>
 * @since 0.0.1
 */
@Entity
@Table(name = "NguoiDung")
public class UserEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaND")
    private int id;

    @Column(name = "Email")
    private String email;

    @Column(name = "MatKhau")
    private String password;
    
    @Column(name = "TrangThai")
    @Enumerated(EnumType.STRING)
    private StatusEnum status;
    
    @ManyToOne
    @JoinColumn(name = "VaiTro")
    private RoleEntity role;
    
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<StaffEntity> staffs;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<CandidateEntity> candidate; 

    public UserEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public RoleEntity getRole() {
        return role;
    }

    public void setRole(RoleEntity role) {
        this.role = role;
    }

    public List<StaffEntity> getStaffs() {
        return staffs;
    }

    public void setStaffs(List<StaffEntity> staffs) {
        this.staffs = staffs;
    }

    public List<CandidateEntity> getCandidate() {
        return candidate;
    }

    public void setCandidate(List<CandidateEntity> candidate) {
        this.candidate = candidate;
    }

    public StatusEnum getStatus() {
        return status;
    }

    public void setStatus(StatusEnum status) {
        this.status = status;
    }
}
