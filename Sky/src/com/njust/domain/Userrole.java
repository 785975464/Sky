package com.njust.domain;



/**
 * Userrole entity. @author MyEclipse Persistence Tools
 */

public class Userrole  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String username;
     private Integer roleId;


    // Constructors

    /** default constructor */
    public Userrole() {
    }

    
    /** full constructor */
    public Userrole(Integer id, String username, Integer roleId) {
        this.id = id;
        this.username = username;
        this.roleId = roleId;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getRoleId() {
        return this.roleId;
    }
    
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
   








}