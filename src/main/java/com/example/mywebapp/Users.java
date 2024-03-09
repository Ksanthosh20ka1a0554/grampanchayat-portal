package com.example.mywebapp;
import jakarta.persistence.*;

@Entity
public class Users {

	@Id
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(Long phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private Long phonenumber;
	@Override
	public String toString() {
		return "Users [email=" + email + ", phonenumber=" + phonenumber + ", fname=" + fname + ", password=" + password
				+ "]";
	}
	private String fname;
	private String password;
}
