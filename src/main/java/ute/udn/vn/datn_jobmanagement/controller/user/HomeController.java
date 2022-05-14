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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.PostService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping(value = "/user")
public class HomeController {

    @Autowired
    private PostService postService;

    @Autowired
    private CareersService careersService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model) {
        model.addAttribute("posts", postService.getPostsByPostDate());
        model.addAttribute("careerses", careersService.getCareerses());
        return "user/home";
    }

    @GetMapping("/home-candidate")
    public String homeCandidate(Model model) {
        model.addAttribute("posts", postService.getPostsByPostDate());
        return "user/home-user";
    }

}
