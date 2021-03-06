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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import ute.udn.vn.datn_jobmanagement.entities.StaffEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.enums.GenderEnum;
import ute.udn.vn.datn_jobmanagement.service.StaffService;
import ute.udn.vn.datn_jobmanagement.service.UserService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/employer")
public class AccountController {

    @Autowired
    private StaffService staffService;

    @Autowired
    private UserService userService;

    @GetMapping("/account")
    public String showAccount(Model model,
            @RequestParam(value = "message", required = false) String message, 
            @RequestParam(value = "type", required = false) String type, 
            @SessionAttribute("staffId") int staffId) {
        model.addAttribute("staff", staffService.findById(staffId));
        model.addAttribute("genders", GenderEnum.values());
        model.addAttribute("action", "update");
        model.addAttribute("message", message);
        model.addAttribute("type", type);
        return "employer/account";
    }

    @PostMapping("/update-account")
    public String updateAccount(Model model, @ModelAttribute("staff") StaffEntity staffEntity) {
        staffService.save(staffEntity);
        model.addAttribute("message", "C???p nh???t th??ng tin t??i kho???n th??nh c??ng !");
        model.addAttribute("type", "success");
        return "redirect:/employer/account";
    }

    @GetMapping("/change-password")
    public String changePassword(@SessionAttribute("staffId") int staffId,
            //            @RequestParam(value = "message", required = false) String message,
            Model model) {
        model.addAttribute("account", userService.findByStaffId(staffId));
        model.addAttribute("action", "update");
        model.addAttribute("staff", staffService.findById(staffId));
//        model.addAttribute("message", message);
        return "employer/change-password";
    }

    @PostMapping("/result-change-password")
    public String resultChangePassword(@ModelAttribute("account") UserEntity user,
            @SessionAttribute("staffId") int staffId,
            @ModelAttribute("newPassword") String password,
            @ModelAttribute("confirmPassword") String confirmPassword) {
        UserEntity userEntity = userService.findByStaffId(staffId);

        if (userEntity.getPassword().equals(user.getPassword())) {
            if (userService.changePassword(password, confirmPassword)) {
                user.setPassword(password);
                userService.save(user);
                return "redirect:/employer/change-password";
            }
        }

//        } else {
////            return "redirect:/employer/change-password?message=M???t kh???u kh??ng ????ng";
//        }
        return "redirect:/employer/change-password";
    }
}
