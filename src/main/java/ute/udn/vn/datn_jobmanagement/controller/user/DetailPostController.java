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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import ute.udn.vn.datn_jobmanagement.entities.CandidateEntity;
import ute.udn.vn.datn_jobmanagement.entities.FileRecruitmentEntity;
import ute.udn.vn.datn_jobmanagement.entities.PostEntity;
import ute.udn.vn.datn_jobmanagement.service.CandidateService;
import ute.udn.vn.datn_jobmanagement.service.FileRecruitmentService;
import ute.udn.vn.datn_jobmanagement.service.PostService;

/**
 *
 * @author ADMIN
 */
@Controller
@RequestMapping("/user")
public class DetailPostController {

    @Autowired
    private PostService postService;
    
    @Autowired
    private FileRecruitmentService fileRecruitmentService;
    
    @Autowired
    private CandidateService candidateService;
    
    @GetMapping("/detail-post-user/{postId}")
    public String detailPostUser(@PathVariable("postId") int postId,
            @SessionAttribute("candidateId") int candidateId,
            Model model) {
        model.addAttribute("post", postService.findById(postId));
        model.addAttribute("candidate", candidateService.findByCandidateId(candidateId));
        return "user/detail-post-user";
    }
    
    

    @GetMapping("/detail-post/{postId}")
    public String detailPost(@PathVariable("postId") int postId,
            Model model) {
        model.addAttribute("post", postService.findById(postId));
        return "user/detail-post";
    }

    @PostMapping("/result-CV/{postId}")
    public String resultCV(MultipartFile[] files, HttpServletRequest request,
            @ModelAttribute("fileRecruitment") FileRecruitmentEntity fileRecruitmentEntity,
            @SessionAttribute("candidate") CandidateEntity candidateEntity,
            @PathVariable("postId") int postId) {
        
        if (files != null) {
          for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();
                
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/pdf");
                
                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-home\\CV\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // get file name
                String name = file.getOriginalFilename();
                
                if (name == null) {
                    name = "new-CV" + name;
                }
                fileRecruitmentEntity.setFileCV(name);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        }
        
        PostEntity postEntity = new PostEntity();
        postEntity.setId(postId);
        
        fileRecruitmentEntity.setPost(postEntity);
        fileRecruitmentEntity.setCandidate(candidateEntity);
        fileRecruitmentService.save(fileRecruitmentEntity);
        return "redirect:/user/home-candidate";
    }
}
