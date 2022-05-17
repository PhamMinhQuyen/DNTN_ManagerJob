/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.user;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ute.udn.vn.datn_jobmanagement.entities.CandidateEntity;
import ute.udn.vn.datn_jobmanagement.entities.StaffEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.PostService;
import ute.udn.vn.datn_jobmanagement.service.StaffService;
import ute.udn.vn.datn_jobmanagement.service.UserService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/user")
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private StaffService staffService;

    @Autowired
    private CareersService careersService;

    @Autowired
    private CandidateService candidateService;
    
    @Autowired
    private PostService postService;

    @GetMapping("/login")
    public String showLogin(HttpSession session) {
        session.removeAttribute("staffId");
        session.removeAttribute("candidateId");
        return "user/login";
    }

    @PostMapping("/checkLogin")
    public String checkLogin(Model model, @ModelAttribute("user") UserEntity user,
            HttpSession session) {
        StaffEntity staffEntity = staffService.getNameByEmailUser(user.getEmail());
        if (userService.checkLogin(user.getEmail(), user.getPassword())) {
            session.setAttribute("staffId", staffEntity.getId());
            session.setMaxInactiveInterval(10000);
            model.addAttribute("careerses", careersService.getCareerses());
            return "redirect:/employer/home";
        }
        if (userService.checkLoginCandidate(user.getEmail(), user.getPassword())) {
            CandidateEntity candidateEntity = candidateService.findCandidateByEmailUser(user.getEmail());
            session.setMaxInactiveInterval(10000);
            session.setAttribute("candidateId", candidateEntity.getId());
            return "redirect:/user/home-candidate";
        }
        return "user/login";

    }
}
