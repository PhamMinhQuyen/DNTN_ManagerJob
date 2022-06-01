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
import ute.udn.vn.datn_jobmanagement.entities.EducationEntity;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.DegreeService;
import ute.udn.vn.datn_jobmanagement.service.EducationService;
import ute.udn.vn.datn_jobmanagement.service.LanguageService;
import ute.udn.vn.datn_jobmanagement.service.LevelService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class EducationController {

    @Autowired
    private CandidateService candidateService;

    @Autowired
    private DegreeService degreeService;

    @Autowired
    private LanguageService languageService;

    @Autowired
    private EducationService educationService;

    @Autowired
    private LevelService levelService;

    @GetMapping("/education")
    public String updateEducation(Model model, @SessionAttribute("candidateId") int candidateId,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "message", required = false) String message) {
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        model.addAttribute("degrees", degreeService.getDegrees());
        model.addAttribute("languages", languageService.getLanguages());
        model.addAttribute("education", educationService.getEducationByCandidateId(candidateId));
        model.addAttribute("levels", levelService.getLevels());
        model.addAttribute("action", "update");
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        return "user/education";
    }

    @PostMapping("/result-update-education")
    public String resultUpdateEducation(@ModelAttribute("education") EducationEntity educationEntity,
            Model model) {
        educationService.save(educationEntity);
        model.addAttribute("message", "Cập nhật học vấn thành công !");
        model.addAttribute("type", "success");
        return "redirect:/user/education";
    }
}
