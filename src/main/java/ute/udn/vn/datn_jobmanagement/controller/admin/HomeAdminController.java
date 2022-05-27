/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/admin")
public class HomeAdminController {
    
    @GetMapping("/home-admin")
    public String HomeAdmin(@SessionAttribute("admin") String email,
            Model model) {
        model.addAttribute("email", email);
        return "admin/home-admin";
    }
}
