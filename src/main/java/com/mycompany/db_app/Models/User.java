package com.mycompany.db_app.Models;

public class User {
    protected String username;
    protected String password;
    
    public User(String username, String password){
        this.username = username;
        this.password = password;
    }
    
    private void validateLogin(){
        
    }
    
}
