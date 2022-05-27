/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.employer;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import ute.udn.vn.datn_jobmanagement.entities.EmployerEntity;
import ute.udn.vn.datn_jobmanagement.service.CareersService;
import ute.udn.vn.datn_jobmanagement.service.EmployerService;
import ute.udn.vn.datn_jobmanagement.service.PostService;
import ute.udn.vn.datn_jobmanagement.service.ScaleService;
import ute.udn.vn.datn_jobmanagement.service.StaffService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/employer")
public class EmployerController {

    @Autowired
    private CareersService careersService;

    @Autowired
    private ScaleService scaleService;

    @Autowired
    private EmployerService employerService;

    @Autowired
    private StaffService staffService;
    
    @Autowired
    private PostService postService;
    
    @GetMapping("/information-company")
    public String informationCompany(Model model, @SessionAttribute("staffId") int staffId) {
        model.addAttribute("careerses", careersService.getCareerses());
        model.addAttribute("scales", scaleService.getScales());
        model.addAttribute("employer", employerService.getEmployerByStaffId(staffId));
        model.addAttribute("staff", staffService.findById(staffId));
        model.addAttribute("action", "update");
    return "employer/information-company";
    }

    @PostMapping("/result-information-company")
    public String updateInformationCompany(@ModelAttribute("employer") EmployerEntity employerEntity,  MultipartFile[] files,
           HttpServletRequest request
          ) {
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
        return "redirect:/employer/information-company";
    }
    
    @GetMapping("detail-employer/{employerId}")
    public String detailEmployer(Model model, @PathVariable("employerId") int employerId) {
        model.addAttribute("employer", employerService.findById(employerId));
        model.addAttribute("posts", postService.findByEmployerId(employerId));
        return "employer/detail-employer";
    }
}
