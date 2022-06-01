/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.CandidateJobEntity;
import ute.udn.vn.datn_jobmanagement.repository.CandidateJobRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class CandidateJobService {
    
    @Autowired
    private CandidateJobRepository candidateJobRepository;
    
    public void save(CandidateJobEntity candidateJobEntity) {
        candidateJobRepository.save(candidateJobEntity);
    }
    
    public CandidateJobEntity findByCandidateId(int candidateId) {
        Optional<CandidateJobEntity> optional = candidateJobRepository.findByCandidate_Id(candidateId);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new CandidateJobEntity();
    }
}
