package com.crud.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crud.bean.User;
import com.mysql.jdbc.PreparedStatement;

public class UserDAO {
	public static Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/java-crud", "root", "");
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return connection;
	}
	
	public static List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();
		
		try {
			Connection connection = getConnection();
		
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("SELECT * FROM usuario;");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setNome(rs.getString("nome"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setSexo(rs.getString("sexo"));
				user.setPais(rs.getString("pais"));
				
				list.add(user);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
		
	}
	
	public static User getById(int id) {
		User userCompleted = null;
		
		try {
			Connection connection = getConnection();
			
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("SELECT * FROM usuario WHERE id = ?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setNome(rs.getString("nome"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setSexo(rs.getString("sexo"));
				user.setPais(rs.getString("pais"));
				
				userCompleted = user;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return userCompleted;
	}
	
	public static int updateUser(User u) {
		int status = 0;
		
		try {
			Connection connection = getConnection();
			
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("UPDATE usuario SET nome = ?, password = ?, email = ?, sexo = ?, pais = ? where id = ?;");
			
			ps.setString(1, u.getNome());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			ps.setInt(6, u.getId());
			
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return status;
	}
	
	public static boolean createUser(User u) {
		boolean status = false;
		
		try {
			Connection connection = getConnection();
			
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("INSERT INTO usuario (nome, password, email, sexo, pais) VALUE (?,?,?,?,?)");
			
			ps.setString(1, u.getNome());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			
			status = ps.execute();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return status;
	}
	
	public static boolean deleteUser(int id) {
		boolean status = false;
		
		try {
			Connection connection = getConnection();
			
			PreparedStatement ps = (PreparedStatement) connection.prepareStatement("DELETE FROM usuario WHERE id = ?");
			
			ps.setInt(1, id);
			
			status = ps.execute();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return status;
	}
	
	
	
	
	
	
	
	
	
}
