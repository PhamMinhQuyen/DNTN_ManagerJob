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
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.PostEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface PostRepository extends CrudRepository<PostEntity, Integer> {
    
    @Query("SELECT p FROM PostEntity p WHERE p.staff.id = ?1")
    public List<PostEntity> findByStaffId(int staffId);
    
    @Query("SELECT p FROM PostEntity p ORDER BY postDate DESC")
    public List<PostEntity> findByPostDate_OrderByDesc();
}
