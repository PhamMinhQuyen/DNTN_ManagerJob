/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.SkillEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface SkillReposiitory extends CrudRepository<SkillEntity, Integer> {
    
     @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM kynang AS kn\n"
            + "WHERE kn.MaUV = ?1")
    public List<SkillEntity> findByCandidateId(int candidateId);
    
    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM kynang AS kn\n"
            + "WHERE kn.MaUV = ?1")
    public Optional<SkillEntity> findSkillByCandidateId(int candidateId);
    
}
