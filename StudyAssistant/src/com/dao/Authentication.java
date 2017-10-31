package com.dao;

import java.sql.*;
import com.beans.UserBean;

public class Authentication {

	public static int register(UserBean bean)
	{
		int status = 0;
		try{
			Connection con = DB.getCon();
			Statement st = con.createStatement();
			String insertQuery = "INSERT INTO user_details (name,email,credentials) VALUES('"+bean.getName()+"','"+bean.getEmail()+"','("+bean.getUserName()+","+bean.getPassword()+")')";
			status = st.executeUpdate(insertQuery);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}	
	
	public static int login(UserBean bean)
	{
		int status = 0;
		try{
			Connection con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT username,password FROM user_details WHERE username = '"+bean.getUserName()+"'";
			ResultSet rs = st.executeQuery(query);
			String dbUserName = rs.getString(1);
			String dbPassword = rs.getString(2);
			if(dbUserName.equals(bean.getUserName()) && dbPassword.equals(bean.getPassword()))
			{
				status = 1;
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
}
