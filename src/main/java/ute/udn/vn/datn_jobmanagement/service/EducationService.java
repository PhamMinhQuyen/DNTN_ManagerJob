/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.util.List;
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
    
    public List<EducationEntity> getEducationByCandidateId(int candidateId) {
        return educationRepository.findByCandidateId(candidateId);
    }
    
    public List<EducationEntity> getEducationByStaffId(int staffId) {
        return educationRepository.findByStaffId(staffId);
    }
}
