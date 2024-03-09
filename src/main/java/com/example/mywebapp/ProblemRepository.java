package com.example.mywebapp;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProblemRepository extends JpaRepository<Problems, Integer>{

	List<Problems> findByuserid(String userid);

}
