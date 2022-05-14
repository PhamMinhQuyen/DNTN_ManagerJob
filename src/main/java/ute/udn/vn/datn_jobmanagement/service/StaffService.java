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
import ute.udn.vn.datn_jobmanagement.entities.StaffEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.repository.StaffRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class StaffService {

    @Autowired
    private StaffRepository staffRepository;

    public StaffEntity getNameByEmailUser(String email) {
        return staffRepository.getNameByEmailUser(email);
    }

    public void save(StaffEntity staffEntity) {
        staffRepository.save(staffEntity);
    }
    
    public StaffEntity findById(int id) {
        Optional<StaffEntity> optional = staffRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new StaffEntity();
    }
}
