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
import ute.udn.vn.datn_jobmanagement.entities.CandidateEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface CandidateRepository extends CrudRepository<CandidateEntity, Integer> {

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM ungvien AS uv\n"
            + "JOIN hocvan AS hv\n"
            + "ON uv.MaUV = hv.MaUV\n"
            + "WHERE uv.MaUV = ?1")
    public Optional<CandidateEntity> findByCandidateId(int candidateId);

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM nguoidung AS nd\n"
            + "JOIN ungvien AS uv\n"
            + "ON nd.MaND = uv.MaND\n"
            + "WHERE nd.Email = ?1 ")
    public CandidateEntity findCandidateByEmailUser(String email);
}
