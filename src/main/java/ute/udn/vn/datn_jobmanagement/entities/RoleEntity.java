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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import ute.udn.vn.datn_jobmanagement.enums.RoleEnum;

/**
 * Quyền Entity
 *
 * @author QuyenPM <1811505310235@sv.ute.udn.vn>
 * @since 0.0.1
 */
@Entity
@Table(name = "LoaiNguoiDung")
public class RoleEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaLND")
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(name = "NguoiDung")
    private RoleEnum nameRole;
    
    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<UserEntity> users;

//    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    @JoinTable(name = "ChiTietQuyen",
//            joinColumns = @JoinColumn(name = "MaQuyen",
//                    referencedColumnName = "MaQuyen"),
//            inverseJoinColumns = @JoinColumn(
//                    name = "MaND",
//                    referencedColumnName = "MaND"))
//    private Set<UserEntity> users;

    public RoleEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public RoleEnum getNameRole() {
        return nameRole;
    }

    public void setNameRole(RoleEnum nameRole) {
        this.nameRole = nameRole;
    }

    public List<UserEntity> getUsers() {
        return users;
    }

    public void setUsers(List<UserEntity> users) {
        this.users = users;
    }
}
