/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.PostEntity;
import ute.udn.vn.datn_jobmanagement.repository.PostRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    public void savePost(PostEntity postEntity) {
       
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String strDate = formatter.format(new Date());
        try {
            postEntity.setPostDate(formatter.parse(strDate));
        } catch (ParseException ex) {
            Logger.getLogger(PostService.class.getName()).log(Level.SEVERE, null, ex);
        }
        postRepository.save(postEntity);
    }
    
    public Page<PostEntity> showPostByStaffId(int staffId, Pageable pageable) {
        return postRepository.findByStaff_IdOrderByPostDateDesc(staffId, pageable);
    }
    
    public boolean deletePost(int id) {
        postRepository.deleteById(id);
        return postRepository.existsById(id);
    }
    
    public PostEntity findById(int id) {
        Optional<PostEntity> optional = postRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new PostEntity();
    }
    
    public List<PostEntity> getPosts() {
        return (List<PostEntity>) postRepository.findAll();
    }
    
    public List<PostEntity> getPostsByPostDate() {
        return postRepository.findByPostDate_OrderByDesc();
    }
    
    public Page<PostEntity> getPostsPage(Pageable pageable) {
        return postRepository.findAll(pageable);
    }
    
    public List<PostEntity> findByEmployerId(int employerId) {
        return postRepository.findByEmployerId(employerId);
    }
    
    public Page<PostEntity> searchByName(int careersId, String name, String company, Pageable pageable) {
        return postRepository.findByCareers_IdAndNameContainingAndStaff_Employer_NameContaining(careersId, name, company, pageable);
    }
    
    public Page<PostEntity> searchByName(String name, int staffId, Pageable pageable) {
        return postRepository.findByNameContainingAndStaff_Id(name, staffId, pageable);
    }
}
