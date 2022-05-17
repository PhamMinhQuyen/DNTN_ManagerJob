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
import ute.udn.vn.datn_jobmanagement.entities.EducationEntity;
import ute.udn.vn.datn_jobmanagement.repository.EducationRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class EducationService {
    
    @Autowired
    private EducationRepository educationRepository;
    
    public EducationEntity getEducationByCandidateId(int candidateId) {
        Optional<EducationEntity> optional = educationRepository.findByCandidateId(candidateId);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new EducationEntity();
    }
    
    public List<EducationEntity> getEducationByStaffId(int staffId) {
        return educationRepository.findByStaffId(staffId);
    }
    
    public void save(EducationEntity educationEntity) {
        educationRepository.save(educationEntity);
    }
}
