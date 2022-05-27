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
import ute.udn.vn.datn_jobmanagement.entities.CareersEntity;
import ute.udn.vn.datn_jobmanagement.repository.CareersRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class CareersService {
    
    @Autowired
    private CareersRepository careersRepository;
    
    public List<CareersEntity> getCareerses() {
        return (List<CareersEntity>) careersRepository.findAll();
    }
    
    public void save(CareersEntity careersEntity) {
        careersRepository.save(careersEntity);
    }
    
    public List<CareersEntity> findByName(String name) {
        return careersRepository.findByNameContaining(name);
    }
    
    public CareersEntity findById(int id) {
        Optional<CareersEntity> optional = careersRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new CareersEntity();
    }
    
    public Boolean deleteById(int id) {
        careersRepository.deleteById(id);
        return careersRepository.existsById(id);
    }
}
