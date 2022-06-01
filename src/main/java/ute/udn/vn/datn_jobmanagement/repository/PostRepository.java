/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.PostEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface PostRepository extends CrudRepository<PostEntity, Integer> {

    public Page<PostEntity> findByStaff_IdOrderByPostDateDesc(int staffId, Pageable pageable);

    @Query("SELECT p FROM PostEntity p ORDER BY postDate DESC")
    public List<PostEntity> findByPostDate_OrderByDesc();

    @Query("SELECT p FROM PostEntity p ORDER BY postDate DESC")
    public Page<PostEntity> findAll(Pageable pageable);

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM baidang AS bd\n"
            + "JOIN nhanvien AS nv\n"
            + "ON bd.MaNV = nv.MaNV\n"
            + "JOIN nhatuyendung AS ntd\n"
            + "ON ntd.MaCT = nv.MaCT\n"
            + "WHERE ntd.MaCT = ?1")
    public List<PostEntity> findByEmployerId(int employerId);
    
    public Page<PostEntity> findByCareers_IdAndNameContainingAndStaff_Employer_NameContaining(int careersId, String name, 
            String company, Pageable pageable);
    
    public Page<PostEntity> findByNameContainingAndStaff_Id(String name, int staffId, Pageable pageable);
}
