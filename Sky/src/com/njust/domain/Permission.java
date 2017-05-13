package com.njust.domain;



/**
 * Permission entity. @author MyEclipse Persistence Tools
 */

public class Permission  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String resource;


    // Constructors

    /** default constructor */
    public Permission() {
    }

	/** minimal constructor */
    public Permission(Integer id) {
        this.id = id;
    }
    
    /** full constructor */
    public Permission(Integer id, String resource) {
        this.id = id;
        this.resource = resource;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getResource() {
        return this.resource;
    }
    
    public void setResource(String resource) {
        this.resource = resource;
    }
   








}