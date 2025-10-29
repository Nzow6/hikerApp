/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.db_app;

import java.sql.*;

public class Main {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/employees";
    private static final String USER = "root";
    private static final String PASSWORD = "secret hehe";

    public static Connection conn = null;

    public static void main(String[] args) {
        connectDB();
        /*
        javax.swing.SwingUtilities.invokeLater(() -> {
            UserModel user = new UserModel();
            LoginView view = new LoginView();
            new LoginController(model, view);
            view.setVisible(true);

             
        });*/
        
        
    }

    // Establish a connection to the DB
    public static void connectDB() {
        try {
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
            System.out.println("Connected to World DB!");
            /* Test (REMOVE LATER)
            String query = "SELECT * FROM employees";
            Statement st = conn.createStatement();
            ResultSet res = st.executeQuery(query);
            
            
            System.out.printf("%-10s %-12s %-15s %-15s %-8s %-12s%n",
                    "emp_no", "birth_date", "first_name", "last_name", "gender", "hire_date");
            System.out.println("--------------------------------------------------------------------------");

            
            while (res.next()) {
                int empNo = res.getInt("emp_no");
                Date birthDate = res.getDate("birth_date");
                String firstName = res.getString("first_name");
                String lastName = res.getString("last_name");
                String gender = res.getString("gender");
                Date hireDate = res.getDate("hire_date");

                System.out.printf("%-10d %-12s %-15s %-15s %-8s %-12s%n",
                        empNo, birthDate, firstName, lastName, gender, hireDate);
            }
            */
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}

