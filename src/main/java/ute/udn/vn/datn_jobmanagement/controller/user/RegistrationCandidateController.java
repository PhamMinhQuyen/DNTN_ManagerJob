/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ute.udn.vn.datn_jobmanagement.entities.CandidateEntity;
import ute.udn.vn.datn_jobmanagement.entities.RoleEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.UserService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class RegistrationCandidateController {
    
    @Autowired
    private CandidateService candidateService;
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/registration-candidate")
    public String registrationCandidate() {
        return "user/registration-candidate";
    }
    
    @PostMapping("/resultRegistrationCandidate")
    public String resultRegistrationCandidate(@ModelAttribute("candidate") CandidateEntity candidateEntity,
            @ModelAttribute("email") String email,
            @ModelAttribute("password") String password) {
        RoleEntity roleEntity = new RoleEntity();
        roleEntity.setId(3);
        
        UserEntity userEntity = new UserEntity();
        userEntity.setRole(roleEntity);
        userEntity.setEmail(email);
        userEntity.setPassword(password);
        userService.save(userEntity);
        
        candidateEntity.setUser(userEntity);
        candidateService.save(candidateEntity);
        return "user/login";
    }
    
}
