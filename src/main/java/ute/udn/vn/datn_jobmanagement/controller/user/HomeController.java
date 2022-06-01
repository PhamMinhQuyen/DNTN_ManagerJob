/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.user;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.EmployerService;
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
    
    @Autowired
    private CandidateService candidateService;
    
    @Autowired
    private EmployerService employerService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model,
           @RequestParam("page") Optional<Integer> p
            ) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("page", postService.getPostsPage(pageable));
        model.addAttribute("posts", postService.getPostsByPostDate());
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("employers", employerService.findAll());
        return "user/home";
    }

    @GetMapping("/home-candidate")
    public String homeCandidate(Model model, @SessionAttribute("candidateId") int candidateId,
            @RequestParam("page") Optional<Integer> p) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        model.addAttribute("posts", postService.getPostsByPostDate());
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("employers", employerService.findAll());
        model.addAttribute("page", postService.getPostsPage(pageable));
        return "user/home-user";
    }
    
    @PostMapping("/search")
    public String searchNamePost(@ModelAttribute("name") String name,
            @ModelAttribute("company") String company,
            @ModelAttribute("careers") int careersId,
            @RequestParam("page") Optional<Integer> p,
            Model model) {
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        model.addAttribute("page", postService.searchByName(careersId,name, company, pageable));
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("employers", employerService.findAll());
        model.addAttribute("posts", postService.getPostsByPostDate());
        
        return "/user/home";
    }
}
