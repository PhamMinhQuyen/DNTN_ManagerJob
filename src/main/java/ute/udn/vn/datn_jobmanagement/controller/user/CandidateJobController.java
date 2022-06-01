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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.entities.CandidateJobEntity;
import ute.udn.vn.datn_jobmanagement.enums.WorkingFormEnum;
import ute.udn.vn.datn_jobmanagement.service.CandidateJobService;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.RankService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class CandidateJobController {
    
    @Autowired
    private RankService rankService;
    
    @Autowired
    private CareersService careersService;
    
    @Autowired
    private CandidateJobService candidateJobService;
    
    @Autowired
    private CandidateService candidateService;
    
    @GetMapping("/candidate-job")
    public String updateCandidateJob(Model model, @SessionAttribute("candidateId") int candidateId,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("ranks", rankService.getRanks());
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("workings", WorkingFormEnum.values());
        model.addAttribute("candidateId", candidateId);
        model.addAttribute("candidateJob", candidateJobService.findByCandidateId(candidateId));
        model.addAttribute("action", "update");
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        return "user/candidate-job";
    }
    
    @PostMapping("/result-update-candidate-job")
    public String resultUpdateCandidateJob(@ModelAttribute("candidateJob") CandidateJobEntity candidateJobEntity,
            Model model) {
        
        candidateJobService.save(candidateJobEntity);
        model.addAttribute("message", "Cập nhật thông tin công việc thành công !");
        model.addAttribute("type", "success");
        return "redirect:/user/candidate-job";
    }
}
