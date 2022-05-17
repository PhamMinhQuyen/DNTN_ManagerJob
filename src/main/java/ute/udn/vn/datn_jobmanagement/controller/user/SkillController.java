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
import ute.udn.vn.datn_jobmanagement.entities.SkillEntity;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.SkillService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class SkillController {
    
    @Autowired
    private CandidateService candidateService;
    
    @Autowired
    private SkillService skillService;
    
    @GetMapping("/skill")
    public String updateSkill(Model model, @SessionAttribute("candidateId") int candidateId) {
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        model.addAttribute("skill", skillService.getSkillByCanidateId(candidateId));
        model.addAttribute("action", "update");
        return "user/skill";
    }
    
    @PostMapping("/result-update-skill")
    public String resultUpdateSkill(@ModelAttribute("skill") SkillEntity skillEntity) {
        skillService.save(skillEntity);
        return "redirect:/user/skill";
    }
}
