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
import ute.udn.vn.datn_jobmanagement.entities.EmployerEntity;
import ute.udn.vn.datn_jobmanagement.repository.EmployerRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class EmployerService {
    
    @Autowired
    private EmployerRepository employerRepository;
    
    public void save(EmployerEntity employerEntity) {
        employerRepository.save(employerEntity);
    }
    
    public EmployerEntity getEmployerByStaffId(int staffId) {
         Optional<EmployerEntity> optional = employerRepository.findByStaffId(staffId);
         if (optional.isPresent()) {
            return optional.get();
        }
        return new EmployerEntity();
    }
    
    public List<EmployerEntity> findAll() {
        return (List<EmployerEntity>) employerRepository.findAll();
    }
    
    public EmployerEntity findById(int id) {
         Optional<EmployerEntity> optional = employerRepository.findById(id);
         if (optional.isPresent()) {
            return optional.get();
        }
        return new EmployerEntity();
    }
}
