/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.entities.CandidateEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.UserService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class ChangePasswordController {
    
    @Autowired
    private CandidateService candidateService;
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/change-password-user")
    public String changePasswordUser(@SessionAttribute("candidateId") int candidateId,
            Model model) {
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        model.addAttribute("action", "update");
        return "user/change-password";
    }
    
    @PostMapping("/result-change-password-user")
    public String resultChangePasswordUser(@ModelAttribute("user") UserEntity userEntity,
            @ModelAttribute("newPassword") String password,
            @ModelAttribute("confirmPassword") String confirmPassword,
            @SessionAttribute("candidateId") int candidateId) {
        CandidateEntity candidateEntity  = candidateService.findByCandidateId(candidateId);
        if (candidateEntity.getUser().getPassword().equals(userEntity.getPassword())) {
            if (userService.changePassword(password, confirmPassword)) {
                userEntity.setPassword(password);
                userService.save(userEntity);
            }
        }
        return "redirect:/user/change-password-user";
    }
}
