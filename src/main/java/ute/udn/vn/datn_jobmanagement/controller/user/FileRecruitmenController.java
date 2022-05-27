/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.FileRecruitmentService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class FileRecruitmenController {
    
    @Autowired
    private CandidateService candidateService;
    
    @Autowired
    private FileRecruitmentService fileRecruitmentService;
    
    @GetMapping("/file-recruitment")
    public String jobManagement(@SessionAttribute("candidateId") int candidateId,
            Model model) {
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        model.addAttribute("fileRecruitments", fileRecruitmentService.findByCandidateId(candidateId));
        return "user/file-recruitment";
    }
    
//    @GetMapping("/delete-fileRecruitment/{fileRecruitmentId}")
//    public String deleteFileRecruitment(@PathVariable("fileRecruitmentId") int fileRecruitmentId) {
//        fileRecruitmentService.deleteById(fileRecruitmentId);
//        return "redirect:/user/file-recruitment";
//    }
}
