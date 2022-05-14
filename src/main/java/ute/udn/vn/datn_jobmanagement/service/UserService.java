/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.repository.UserRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public Boolean checkLogin(String email, String password) {
        UserEntity user = userRepository.findStaffByEmailAndPassword(email, password);
        if (user != null) {
            return true;
        }
        return false;
    }

    public Boolean changePassword(String password, String confirmPassword) {
        if ((password == null && confirmPassword != null)
                || (password != null && confirmPassword == null)) {
            return false;
        }
        return password.equals(confirmPassword);
    }
    
    public UserEntity findByStaffId(int staffId) {
        Optional<UserEntity> optional = userRepository.findByStaffId(staffId);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new UserEntity();
    }
    
    public void save(UserEntity userEntity) {
        userRepository.save(userEntity);
    }
    
    public UserEntity findByUserId(int userId) {
        Optional<UserEntity> optional = userRepository.findById(userId);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new UserEntity();
    }
    
    public Boolean checkLoginCandidate(String email, String password) {
        UserEntity user = userRepository.findCandidateByEmailAndPassword(email, password);
        if (user != null) {
            return true;
        }
        return false;
    }
}
