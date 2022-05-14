/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.ExperienceEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface ExperienceRepository extends CrudRepository<ExperienceEntity, Integer> {

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM kinhnghiem AS kn\n"
            + "WHERE kn.MaUV = ?1")
    public List<ExperienceEntity> findByCandidateId(int candidateId);
}
