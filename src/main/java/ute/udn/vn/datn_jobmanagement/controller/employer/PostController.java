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
import ute.udn.vn.datn_jobmanagement.entities.PostEntity;
import ute.udn.vn.datn_jobmanagement.entities.StaffEntity;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.EmployerService;
import ute.udn.vn.datn_jobmanagement.service.PostService;
import ute.udn.vn.datn_jobmanagement.service.RankService;
import ute.udn.vn.datn_jobmanagement.service.StaffService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/employer")
public class PostController {

    @Autowired
    private RankService rankService;

    @Autowired
    private CareersService careersService;

    @Autowired
    private PostService postService;
    
    @Autowired
    private StaffService staffService;
    
    @Autowired
    private EmployerService employerService;

    @GetMapping("/add-job")
    public String addJobEmployer(Model model, @SessionAttribute("staffId") int staffId) {

        model.addAttribute("staff", staffService.findById(staffId));
        model.addAttribute("ranks", rankService.getRanks());
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("job", new PostEntity());
        model.addAttribute("action", "add");
        model.addAttribute("employer", employerService.getEmployerByStaffId(staffId));
        return "employer/add-job";
    }

    @PostMapping("/result-add-job")
    public String resultAddJob(Model model,
            @ModelAttribute("job") PostEntity postEntity,
            @SessionAttribute("staffId") int staffId) {
        
        StaffEntity staffEntity = new StaffEntity();
        staffEntity.setId(staffId);
        postEntity.setStaff(staffEntity);
        postService.savePost(postEntity);
        return "redirect:/employer/list-post/" + staffEntity.getId();
    }

    @GetMapping("/list-post/{staffId}")
    public String showListPost(Model model, @PathVariable("staffId") int staffId) {
        model.addAttribute("employer", employerService.getEmployerByStaffId(staffId));
        model.addAttribute("posts", postService.showPostByStaffId(staffId));
        model.addAttribute("staff", staffService.findById(staffId));
        return "employer/list-post";
    }

    @GetMapping("/delete-post/{postId}")
    public String deletePost(@PathVariable("postId") int id, @SessionAttribute("staffId") int staffId) {
        postService.deletePost(id);
        return "redirect:/employer/list-post/" + staffId;
    }

    @GetMapping("/update-post/{postId}")
    public String updatePost(Model model, @PathVariable("postId") int id,@SessionAttribute("staffId") int staffId) {
        model.addAttribute("job", postService.findById(id));
        model.addAttribute("ranks", rankService.getRanks());
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("employer", employerService.getEmployerByStaffId(staffId));
        model.addAttribute("staff", staffService.findById(staffId));
        model.addAttribute("action", "update");
        return "employer/add-job";
    }
}
