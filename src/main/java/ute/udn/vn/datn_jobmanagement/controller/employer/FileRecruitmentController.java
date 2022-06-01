/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.employer;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.entities.FileRecruitmentEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.service.EducationService;
import ute.udn.vn.datn_jobmanagement.service.ExperienceService;
import ute.udn.vn.datn_jobmanagement.service.FileRecruitmentService;
import ute.udn.vn.datn_jobmanagement.service.SkillService;
import ute.udn.vn.datn_jobmanagement.service.StaffService;
import ute.udn.vn.datn_jobmanagement.service.UserService;

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
    
    @Autowired
    private UserService userService;

    @GetMapping("/file-recruitment")
    public String listFileRecruitment(@SessionAttribute("staffId") int staffId,
            Model model, @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 6);
        model.addAttribute("files", fileRecruitmentService.getFileRecruitments(staffId, pageable));
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
        model.addAttribute("educations", educationService.getEducationsByCandidateId(file.getCandidate().getId()));
        model.addAttribute("skills", skillService.getEducationByCandidateId(file.getCandidate().getId()));
        model.addAttribute("experiences", experienceService.findExperiencesByCandidateId(file.getCandidate().getId()));
        return "employer/detail-file-recruitment";
    }

    @GetMapping("/mail/{userId}")
    public String sendMail(@ModelAttribute("userId") int userId, Model model,
            @SessionAttribute("staffId") int staffId) {
        model.addAttribute("staff", staffService.findById(staffId));
        model.addAttribute("user", userService.findByUserId(userId));
        return "employer/send-mail";
    }

    @PostMapping("result-send-mail")
    public String resultSendMail(
           @ModelAttribute("email") String email,
           @ModelAttribute("title") String title, 
           @ModelAttribute("content") String content,
           @SessionAttribute("staffId") int staffId
           ) {
        UserEntity userEntity = userService.findByStaffId(staffId);
        fileRecruitmentService.sendMail(userEntity.getEmail(), email, title, content);
        // sửa lại chỗ trả về, hơi bất ổn đó q nge
        return "redirect:/employer/mail/" + userEntity.getId();
    }
    
    @PostMapping("/searchFileRecruiment_Name")
    public String searchFileRecruiment_Name(Model model,
            @ModelAttribute("name") String name,
            @SessionAttribute("staffId") int staffId,
            @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 6);
        model.addAttribute("files", fileRecruitmentService.searchFileRecruitmentByPost_Name(name,  pageable));
        return "employer/file-recruitment";
    }

}
