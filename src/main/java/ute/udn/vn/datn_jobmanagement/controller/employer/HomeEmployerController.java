/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.employer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.entities.StaffEntity;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.EmployerService;
import ute.udn.vn.datn_jobmanagement.service.PostService;
import ute.udn.vn.datn_jobmanagement.service.StaffService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/employer")
public class HomeEmployerController {
    
    @Autowired
    private PostService postService;
    
    @Autowired
    private CareersService careersService;
    
    @Autowired
    private StaffService staffService;
    
    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public String homeEmployer(Model model, @SessionAttribute("staffId") int staffId) {
        model.addAttribute("posts", postService.getPosts());
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("staff", staffService.findById(staffId));
        return "employer/home-employer";
    }
}
