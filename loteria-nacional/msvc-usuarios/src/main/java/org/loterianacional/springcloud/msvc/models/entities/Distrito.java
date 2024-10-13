package org.loterianacional.springcloud.msvc.models.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "dbo.ubigeoPeruDistricts")
public class Distrito {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private String id;
    @Column(name = "name")
    private String name;
    @Column(name = "provinceId")
    private String provinceId;
    @Column(name = "departmentId")
    private String departmentId;


    public Distrito(){}
    public Distrito(String id, String name, String provinceId, String departmentId) {
        this.id = id;
        this.name = name;
        this.provinceId = provinceId;
        this.departmentId = departmentId;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }
}
