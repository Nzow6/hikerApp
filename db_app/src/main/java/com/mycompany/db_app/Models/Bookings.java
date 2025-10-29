/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.db_app.Models;

/**
 *
 * @author loren
 */

import java.sql.*;


public class Bookings {
    
    public void addBooking(Connection conn, String hikerID, int eventID, String pMethod, String pNum){
        //Find event price
        double price;
        StringBuilder findPrice = new StringBuilder();
        findPrice.append("SELECT price");
        findPrice.append("FROM hiking_event");
        findPrice.append(String.format("WHERE hiking_event_id = '%d'", eventID));
        
        
        //Assign the retrieved record to price
        try {
            Statement st = conn.createStatement();
            // For fetching multilple records
            ResultSet rs;
            rs = st.executeQuery(findPrice.toString());
            
            rs.next();
            price = rs.getDouble("price");
            
            rs.close();
            st.close();
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        //Find hiking event name
        String event;
        StringBuilder findEvent = new StringBuilder();
        findPrice.append("SELECT hiking_event_name");
        findPrice.append("FROM hiking_event");
        findPrice.append(String.format("WHERE hiking_event_id = '%d'", eventID));
        
        //Assign the retrieved name to event
        try {
            Statement st = conn.createStatement();
            // For fetching multilple records
            ResultSet rs;
            rs = st.executeQuery(findEvent.toString());
            
            rs.next();
            event = rs.getString("hiking_event_name");
            
            rs.close();
            st.close();
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        //Prepare insert statement
        double date = ???;
        StringBuilder addBooking = new StringBuilder();
        addBooking.append("INSERT INTO   booking(hiker_id, hiking_event, booking_date, payment_method, payment_reference_no, amount_paid)");
        addBooking.append(String.format("%s, %s, %s, &s, &s, &f", hikerID, event, date, pMethod, pNum, price));
        
        //Execute insertion
        PreparedStatement stmt;
        stmt = conn.prepareCall(addBooking.toString());
        stmt.executeUpdate();
        
    }
    
}

