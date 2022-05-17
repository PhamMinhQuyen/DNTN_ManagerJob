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
import ute.udn.vn.datn_jobmanagement.entities.ExperienceEntity;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.ExperienceService;
import ute.udn.vn.datn_jobmanagement.service.RankService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class ExperienceController {
    
    @Autowired
    private CandidateService candidateService;
    
    @Autowired
    private ExperienceService experienceService;
    
    @Autowired
    private RankService rankService;
    
    @GetMapping("/experience")
    public String updateExperience(Model model, @SessionAttribute("candidateId") int candidateId) {
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        model.addAttribute("ranks", rankService.getRanks());
        model.addAttribute("action", "update");
        model.addAttribute("experience", experienceService.findByCandidateId(candidateId));
        return "user/experience";
    }
    
    @PostMapping("/result-update-experience")
    public String resultUpdateExperience(@ModelAttribute("experience") ExperienceEntity experienceEntity) {
        experienceService.save(experienceEntity);
        return "redirect:/user/experience";
    }
}
