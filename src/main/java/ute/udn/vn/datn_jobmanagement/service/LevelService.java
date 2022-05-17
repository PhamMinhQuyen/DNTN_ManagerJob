/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.LevelEntity;
import ute.udn.vn.datn_jobmanagement.repository.LevelRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class LevelService {
    
    @Autowired
    private LevelRepository levelRepository;
    
    public List<LevelEntity> getLevels() {
        return (List<LevelEntity>) levelRepository.findAll();
    }
}
