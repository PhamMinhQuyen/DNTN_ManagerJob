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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.service.EmployerService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/admin")
public class ManagerEmployerController {
    
    @Autowired
    private EmployerService employerService;
    
    @GetMapping("/manager-employer")
    public String managerEmployer(Model model,
            @SessionAttribute("admin") String email) {
        model.addAttribute("email", email);
        model.addAttribute("employers", employerService.findAll());
        return "admin/manager-employer";
    }
}
