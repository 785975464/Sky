package com.njust.domain;



/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class Role  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String rolename;


    // Constructors

    /** default constructor */
    public Role() {
    }

	/** minimal constructor */
    public Role(Integer id) {
        this.id = id;
    }
    
    /** full constructor */
    public Role(Integer id, String rolename) {
        this.id = id;
        this.rolename = rolename;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return this.rolename;
    }
    
    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
   








}