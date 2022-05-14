/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.StaffEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface StaffRepository extends CrudRepository<StaffEntity, Integer> {
    
    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM nguoidung as nd\n"
            + "JOIN nhanvien  as nv\n"
            + "ON nd.MaND = nv.MaND\n"
            + "WHERE nd.Email = ?1")
    public StaffEntity getNameByEmailUser(String email);
}
