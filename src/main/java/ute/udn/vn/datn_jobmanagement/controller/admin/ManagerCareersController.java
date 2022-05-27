/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.entities.CareersEntity;
import ute.udn.vn.datn_jobmanagement.service.CareersService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/admin")
public class ManagerCareersController {
    
    @Autowired
    private CareersService careersService;
    
    @GetMapping("/manager-careers")
    public String managerCareers(Model model,
            @SessionAttribute("admin") String email) {
        model.addAttribute("email", email);
        model.addAttribute("careerses", careersService.getCareerses());
        return "admin/manager-careers";
    }
    
    @GetMapping("/add-careers")
    public String addCareers(@SessionAttribute("admin") String email,
            Model model) {
        model.addAttribute("email", email);
        model.addAttribute("action", "add");
        return "admin/add-update-careers";
    }
    
    @PostMapping("/result-add-careers")
    public String resultAddCareers(@ModelAttribute("careers") CareersEntity careersEntity) {
        careersService.save(careersEntity);
        return "redirect:/admin/manager-careers";
    }
    
    @PostMapping("/search-careers")
    public String search(@ModelAttribute("search") String search, Model model) {
        model.addAttribute("careerses", careersService.findByName(search));
        return "admin/manager-careers";
    }
    
    @GetMapping("/update-careers/{careersId}")
    public String updateCareers(@PathVariable("careersId") int careersId,
            Model model) {
        model.addAttribute("action", "update");
        model.addAttribute("careers", careersService.findById(careersId));
        return "admin/add-update-careers";
    }
    
    @GetMapping("/delete-careers/{careersId}")
    public String deleteCareers(@PathVariable("careersId") int careersId) {
        careersService.deleteById(careersId);
        return "redirect:/admin/manager-careers";
    }
}
