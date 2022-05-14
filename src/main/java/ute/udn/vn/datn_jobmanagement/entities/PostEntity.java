/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "BaiDang")
public class PostEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaBD")
    private int id;

    @Column(name = "TieuDe")
    private String name;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "NgayDang")
    private Date postDate;

    @Column(name = "KinhNghiem")
    private String experience;

    @Column(name = "SoLuong")
    private int quantity;

    @Column(name = "MucLuong")
    private String wage;

    @Column(name = "GioiTinh")
    private String gender;
    
    @Column(name = "MoTaCV")
    private String description;
    
    @Column(name = "QuyenLoi")
    private String right;
    
    @Column(name = "YeuCauCV")
    private String request;
    
    @Column(name = "ThongTinLienHe")
    private String contactInfo;
    
    @ManyToOne
    @JoinColumn(name = "MaNV")
    private StaffEntity staff;
    
    @ManyToOne
    @JoinColumn(name = "MaCapBac")
    private RankEntity rank;
    
    @ManyToOne
    @JoinColumn(name = "MaNganhNghe")
    private CareersEntity careers;

    @OneToMany(mappedBy = "post", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<FileRecruitmentEntity> fileRecruitments;
    
    public PostEntity() {
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

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getWage() {
        return wage;
    }

    public void setWage(String wage) {
        this.wage = wage;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRight() {
        return right;
    }

    public void setRight(String right) {
        this.right = right;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public StaffEntity getStaff() {
        return staff;
    }

    public void setStaff(StaffEntity staff) {
        this.staff = staff;
    }

    public RankEntity getRank() {
        return rank;
    }

    public void setRank(RankEntity rank) {
        this.rank = rank;
    }

    public CareersEntity getCareers() {
        return careers;
    }

    public void setCareers(CareersEntity careers) {
        this.careers = careers;
    }

    public List<FileRecruitmentEntity> getFileRecruitments() {
        return fileRecruitments;
    }

    public void setFileRecruitments(List<FileRecruitmentEntity> fileRecruitments) {
        this.fileRecruitments = fileRecruitments;
    }
}
