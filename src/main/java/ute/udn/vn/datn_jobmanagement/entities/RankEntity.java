/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
 *
 * @author ADMIN
 */
@Entity
@Table(name = "CapBac")
public class RankEntity implements Serializable {
    
    @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaCapBac")
    private int id;
    
    @Column(name = "TenCapBac")
    private String name;
    
    @OneToMany(mappedBy = "rank", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<PostEntity> posts;

    public RankEntity() {
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
    
    
}
