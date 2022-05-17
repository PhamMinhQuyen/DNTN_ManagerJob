/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.controller.user;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import ute.udn.vn.datn_jobmanagement.entities.CandidateEntity;
import ute.udn.vn.datn_jobmanagement.entities.RoleEntity;
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;
import ute.udn.vn.datn_jobmanagement.enums.GenderEnum;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.UserService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class InformationUserController {

    @Autowired
    private CandidateService candidateService;

    @Autowired
    private UserService userService;

    @GetMapping("/information-user")
    public String updateInformationUser(Model model, @SessionAttribute("candidateId") int candidateId) {
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        model.addAttribute("genders", GenderEnum.values());
        model.addAttribute("action", "update");
        return "user/information-user";
    }

    @PostMapping("/result-update-information-user")
    public String resultUpdateInformationUser(@ModelAttribute("candidate") CandidateEntity candidateEntity,
            MultipartFile[] files,
            HttpServletRequest request,
            @ModelAttribute("passwordUser") String password,
            @ModelAttribute("emailUser") String email
    ) {
        if (files != null) {
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                try {
                    byte[] bytes = file.getBytes();

                    ServletContext context = request.getServletContext();
                    String pathUrl = context.getRealPath("/images");

                    int index = pathUrl.indexOf("target");
                    String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\img\\user\\";
                    Path path = Paths.get(pathFolder + file.getOriginalFilename());
                    Files.write(path, bytes);

                    // get file name
                    String name = file.getOriginalFilename();

                    if (name == null) {
                        name = "new-image" + name;
                    }
                    
                    RoleEntity roleEntity = new RoleEntity();
                    roleEntity.setId(3);

                    UserEntity userEntity = new UserEntity();
                    userEntity.setId(candidateEntity.getUser().getId());
                    userEntity.setRole(roleEntity);
                    userEntity.setImage(name);
                    userEntity.setEmail(email);
                    userEntity.setPassword(password);
                    
                    userService.save(userEntity);

                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        }
        candidateService.save(candidateEntity);
        return "redirect:/user/information-user";
    }
}
