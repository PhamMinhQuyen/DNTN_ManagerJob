/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.CandidateEntity;
import ute.udn.vn.datn_jobmanagement.repository.CandidateRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class CandidateService {
    
    @Autowired
    private CandidateRepository candidateRepository;
    
    public CandidateEntity findById(int id){
        Optional<CandidateEntity> optional = candidateRepository.findByCandidateId(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new CandidateEntity();
    }
    
    public void save(CandidateEntity candidateEntity) {
        candidateRepository.save(candidateEntity);
    }
    
    public CandidateEntity findCandidateByEmailUser(String email) {
         return candidateRepository.findCandidateByEmailUser(email);
    }
}
