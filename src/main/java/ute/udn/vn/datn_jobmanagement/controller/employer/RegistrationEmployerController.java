/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.employer;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import ute.udn.vn.datn_jobmanagement.entities.EmployerEntity;
import ute.udn.vn.datn_jobmanagement.entities.RoleEntity;
import ute.udn.vn.datn_jobmanagement.entities.StaffEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.enums.StatusEnum;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.EmployerService;
import ute.udn.vn.datn_jobmanagement.service.ScaleService;
import ute.udn.vn.datn_jobmanagement.service.StaffService;
import ute.udn.vn.datn_jobmanagement.service.UserService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/employer")
public class RegistrationEmployerController {
    
    @Autowired
    private CareersService careersService;
    
    @Autowired
    private ScaleService scaleService;
    
    @Autowired
    private StaffService staffService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private EmployerService employerService;
    
    @GetMapping("/registration-employer")
    public String registrationEmployer(Model model) {
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("scales", scaleService.getScales());
        return "user/registration-employer";
    }
    
    @PostMapping("/resultRegistration")
    public String resultRegistration(@ModelAttribute("employer") EmployerEntity employerEntity,
            @ModelAttribute("email") String email,
            @ModelAttribute("password") String password,
            @ModelAttribute("nameStaff") String nameStaff,
             MultipartFile[] files,
             HttpServletRequest request) {
        RoleEntity roleEntity = new RoleEntity();
        roleEntity.setId(2);
        
        UserEntity userEntity = new UserEntity();
        userEntity.setRole(roleEntity);
        userEntity.setEmail(email);
        userEntity.setPassword(password);
        userEntity.setStatus(StatusEnum.ACTIVED);
        userService.save(userEntity);
        
        if (files != null) {
          for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();
                
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");
                
                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-home\\img\\company\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // get file name
                String name = file.getOriginalFilename();
                
                if (name == null) {
                    name = "new-image" + name;
                }
                employerEntity.setLogo(name);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        }
        employerService.save(employerEntity);
        
        StaffEntity staffEntity = new StaffEntity();
        staffEntity.setName(nameStaff);
        staffEntity.setUser(userEntity);
        staffEntity.setEmployer(employerEntity);
        staffService.save(staffEntity);
        return "redirect:/user/login";
    }
}
