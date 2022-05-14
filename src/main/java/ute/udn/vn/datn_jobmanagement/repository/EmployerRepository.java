/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.EmployerEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface EmployerRepository extends CrudRepository<EmployerEntity, Integer> {

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM nhatuyendung AS ntd\n"
            + "JOIN nhanvien AS nv\n"
            + "ON ntd.MaCT = nv.MaCT\n"
            + "WHERE nv.MaNV = ?1")
    public Optional<EmployerEntity> findByStaffId(int id);
}
