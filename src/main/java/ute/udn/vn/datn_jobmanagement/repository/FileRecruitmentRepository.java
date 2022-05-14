/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ute.udn.vn.datn_jobmanagement.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ute.udn.vn.datn_jobmanagement.entities.FileRecruitmentEntity;

/**
 *
 * @author ADMIN
 */
@Repository
public interface FileRecruitmentRepository extends CrudRepository<FileRecruitmentEntity, Integer> {

    @Query(nativeQuery = true, value = "SELECT *\n"
            + "FROM baidang AS bd\n"
            + "JOIN nhanvien AS nv\n"
            + "ON bd.MaNV = nv.MaNV\n"
            + "JOIN hosoungtuyen AS hsut\n"
            + "ON bd.MaBD = hsut.MaBD\n"
            + "WHERE nv.MaNV = ?1")
    public List<FileRecruitmentEntity> getFileRecruitments(int staffId);

    @Query(nativeQuery = true, value = "SELECT * \n"
            + "FROM hosoungtuyen AS hsut\n"
            + "JOIN ungvien AS uv\n"
            + "ON hsut.MaUV = uv.MaUV\n"
            + "WHERE hsut.MaHS = ?1")
    public Optional<FileRecruitmentEntity> findByProfileCodeId(int id);
}
