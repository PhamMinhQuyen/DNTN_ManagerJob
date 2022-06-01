/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.CandidateJobEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface CandidateJobRepository extends CrudRepository<CandidateJobEntity, Integer>{
    
    public Optional<CandidateJobEntity> findByCandidate_Id(int id);
}
