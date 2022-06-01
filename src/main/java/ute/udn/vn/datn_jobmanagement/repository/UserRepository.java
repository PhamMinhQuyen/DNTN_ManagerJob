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
import ute.udn.vn.datn_jobmanagement.entities.UserEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface UserRepository extends CrudRepository<UserEntity, Integer> {

    @Query("SELECT u FROM UserEntity u WHERE u.email = ?1 AND u.password = ?2 AND u.role.id = 2 AND u.status = 'ACTIVED'")
    public UserEntity findStaffByEmailAndPassword(String email, String password);
    
   @Query("SELECT u FROM UserEntity u WHERE u.email = ?1 AND u.password = ?2 AND u.role.id = 3")
    public UserEntity findCandidateByEmailAndPassword(String email, String password);

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM nguoidung AS nd\n"
            + "JOIN nhanvien AS nv\n"
            + "ON nd.MaND = nv.MaND\n"
            + "WHERE nv.MaND = ?1")
    public Optional<UserEntity> findByStaffId(int id);
}
