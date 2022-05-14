/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.employer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.entities.FileRecruitmentEntity;
import ute.udn.vn.datn_jobmanagement.service.EducationService;
import ute.udn.vn.datn_jobmanagement.service.ExperienceService;
import ute.udn.vn.datn_jobmanagement.service.FileRecruitmentService;
import ute.udn.vn.datn_jobmanagement.service.SkillService;
import ute.udn.vn.datn_jobmanagement.service.StaffService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/employer")
public class FileRecruitmentController {
    
    @Autowired
    private FileRecruitmentService fileRecruitmentService;
    
    @Autowired
    private EducationService educationService;
    
    @Autowired
    private ExperienceService experienceService;
    
    @Autowired
    private SkillService skillService;
    
    @Autowired
    private StaffService staffService;
    
    @GetMapping("/file-recruitment")
    public String listFileRecruitment(@SessionAttribute("staffId") int staffId,
            Model model) {
        model.addAttribute("files", fileRecruitmentService.getFileRecruitments(staffId));
        model.addAttribute("educations", educationService.getEducationByStaffId(staffId));
        model.addAttribute("staff", staffService.findById(staffId));
        return "employer/file-recruitment";
    }
    
    @GetMapping("/detail-file-recruitment/{fileId}")
    public String detailFileRecruitment(@PathVariable("fileId") int fileId, @SessionAttribute("staffId") int staffId,
            Model model) {
        model.addAttribute("staff", staffService.findById(staffId));
        FileRecruitmentEntity file = fileRecruitmentService.findById(fileId);
        model.addAttribute("file", file);
        model.addAttribute("educations", educationService.getEducationByCandidateId(file.getCandidate().getId()));
        model.addAttribute("skills", skillService.getEducationByCandidateId(file.getCandidate().getId()));
        model.addAttribute("experiences", experienceService.findByCandidateId(file.getCandidate().getId()));
        return "employer/detail-file-recruitment";
    }
    
    @GetMapping("/mail/{userId}")
    public String sendMail(@ModelAttribute("userId") int userId, Model model,
            @SessionAttribute("staffId") int staffId) {
        model.addAttribute("staff", staffService.findById(staffId));
        return "employer/send-mail";
    }
    
    @PostMapping("result-send-mail")
    public String resultSendMail(
           ) {
        fileRecruitmentService.sendMail("phamngoquyen123456789@gmail.com","minhquyen05112000@gmail.com", "CHÚC MỪNG BẠN ĐÃ TRÚNG TUYỂN", "abc");
        return "user/test";
    }
    
   
}
