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
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.FileRecruitmentEntity;
import ute.udn.vn.datn_jobmanagement.repository.FileRecruitmentRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class FileRecruitmentService {

    @Autowired
    private FileRecruitmentRepository fileRecruitmentRepository;

    //@Autowired thì @Bean sẻ gán vào biến mailSender;
    @Autowired
    MailSender mailSender;

    public Page<FileRecruitmentEntity> getFileRecruitments(int staffId, Pageable pageable) {
        return fileRecruitmentRepository.findByPost_Staff_IdOrderByDateOfFilingDesc(staffId, pageable);
    }

    public FileRecruitmentEntity findById(int id) {
        Optional<FileRecruitmentEntity> optional = fileRecruitmentRepository.findByProfileCodeId(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return new FileRecruitmentEntity();
    }

    public void sendMail(String from, String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }

    public void save(FileRecruitmentEntity fileRecruitmentEntity) {
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String strDate = formatter.format(new Date());
        try {
            fileRecruitmentEntity.setDateOfFiling(formatter.parse(strDate));
        } catch (ParseException ex) {
            Logger.getLogger(PostService.class.getName()).log(Level.SEVERE, null, ex);
        }
        fileRecruitmentRepository.save(fileRecruitmentEntity);
    }
    
    public List<FileRecruitmentEntity> findByCandidateIdAndOrderByDateOfFilingDesc(int candidateId) {
        return fileRecruitmentRepository.findByCandidate_IdOrderByDateOfFilingDesc(candidateId);
    }
    
    public boolean deleteById(int id) {
        fileRecruitmentRepository.deleteById(id);
        return fileRecruitmentRepository.existsById(id);
    }
    
    public FileRecruitmentEntity findByPostIdAndCandidateId(int postId, int Candidate) {
        return fileRecruitmentRepository.findByPost_IdAndCandidate_Id(postId, Candidate);
    }
    
    public Page<FileRecruitmentEntity> searchFileRecruitmentByPost_Name(String name, Pageable pageable) {
        return fileRecruitmentRepository.findByPost_NameContaining(name, pageable);
    }
}
