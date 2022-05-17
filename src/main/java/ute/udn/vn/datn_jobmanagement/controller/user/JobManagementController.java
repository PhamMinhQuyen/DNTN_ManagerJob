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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class JobManagementController {
    
    @Autowired
    private CandidateService candidateService;
    
    @GetMapping("/job-management")
    public String jobManagement(@SessionAttribute("candidateId") int candidateId,
            Model model) {
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        return "user/job-management";
    }
}
