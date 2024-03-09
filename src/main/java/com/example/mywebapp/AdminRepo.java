package com.example.mywebapp;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepo extends JpaRepository<Admin, String>{

	

}
