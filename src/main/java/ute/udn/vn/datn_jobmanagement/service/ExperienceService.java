/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.ExperienceEntity;
import ute.udn.vn.datn_jobmanagement.repository.ExperienceRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class ExperienceService {
    
    @Autowired
    private ExperienceRepository experienceRepository;
    
    public ExperienceEntity findByCandidateId(int candidateId) {
        Optional<ExperienceEntity> optional = experienceRepository.findByCandidateId(candidateId);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new ExperienceEntity();
    }
    
    public void save(ExperienceEntity experienceEntity) {
        experienceRepository.save(experienceEntity);
    }
    
    public List<ExperienceEntity> findExperiencesByCandidateId(int candidateId) {
        return experienceRepository.findExperiencesByCandidateId(candidateId);
    }
}
