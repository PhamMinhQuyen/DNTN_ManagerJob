/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.EducationEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface EducationRepository extends CrudRepository<EducationEntity, Integer> {

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM hocvan AS hv\n"
            + "WHERE hv.MaUV = ?1")
    public List<EducationEntity> findByCandidateId(int candidateId);

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM nhanvien AS nv\n"
            + "JOIN baidang AS bd\n"
            + "ON nv.MaNV = bd.MaNV\n"
            + "JOIN hosoungtuyen AS hsut\n"
            + "ON bd.MaBD = hsut.MaBD\n"
            + "JOIN ungvien AS uv\n"
            + "ON hsut.MaUV = uv.MaUV\n"
            + "JOIN hocvan AS hv\n"
            + "ON uv.MaUV = hv.MaUV\n"
            + "WHERE nv.MaNV = 1")
    public List<EducationEntity> findByStaffId(int staffId);
}
