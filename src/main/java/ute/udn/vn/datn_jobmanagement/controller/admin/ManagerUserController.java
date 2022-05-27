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
import ute.udn.vn.datn_jobmanagement.service.UserService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/admin")
public class ManagerUserController {
    
    @Autowired
    private UserService userService;
            
    @GetMapping("/manager-user")
    public String managerUser(@SessionAttribute("admin") String email,
            Model model) {
        model.addAttribute("email", email);
        model.addAttribute("users", userService.getUsers());
        return "admin/manager-user";
    }
    
    @GetMapping("/add-user")
    public String addUser(Model model,
            @SessionAttribute("admin") String email) {
        model.addAttribute("action", "add");
        model.addAttribute("email", email);
        return "admin/add-user";
    }
}
