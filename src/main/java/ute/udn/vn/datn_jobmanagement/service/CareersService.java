/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ute.udn.vn.datn_jobmanagement.entities.CareersEntity;
import ute.udn.vn.datn_jobmanagement.repository.CareersRepository;

/**
 *
 * @author ADMIN
 */
@Service
public class CareersService {
    
    @Autowired
    private CareersRepository careersRepository;
    
    public List<CareersEntity> getCareerses() {
        return (List<CareersEntity>) careersRepository.findAll();
    }
}
