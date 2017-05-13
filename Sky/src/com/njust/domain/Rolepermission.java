package com.njust.domain;



/**
 * Rolepermission entity. @author MyEclipse Persistence Tools
 */

public class Rolepermission  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer roleId;
     private Integer permissionId;


    // Constructors

    /** default constructor */
    public Rolepermission() {
    }

    
    /** full constructor */
    public Rolepermission(Integer id, Integer roleId, Integer permissionId) {
        this.id = id;
        this.roleId = roleId;
        this.permissionId = permissionId;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return this.roleId;
    }
    
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getPermissionId() {
        return this.permissionId;
    }
    
    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }
   








}