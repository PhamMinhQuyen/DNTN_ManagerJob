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
import ute.udn.vn.datn_jobmanagement.entities.SkillEntity;
import ute.udn.vn.datn_jobmanagement.repository.SkillReposiitory;

/**
 *
 * @author ADMIN
 */
@Service
public class SkillService {
    
    @Autowired
    private SkillReposiitory skillReposiitory;
    
    public List<SkillEntity> getEducationByCandidateId(int candidateId) {
        return skillReposiitory.findByCandidateId(candidateId);
    }
    
    public void save(SkillEntity skillEntity) {
        skillReposiitory.save(skillEntity);
    }
    
    public SkillEntity getSkillByCanidateId(int candidateId) {
        Optional<SkillEntity> optional = skillReposiitory.findSkillByCandidateId(candidateId);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new SkillEntity();
    }
}
