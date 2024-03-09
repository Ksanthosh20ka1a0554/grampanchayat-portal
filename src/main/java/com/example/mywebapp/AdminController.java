package com.example.mywebapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin") 
public class AdminController {
    
    @Autowired
    private ProblemRepository problemRepo;
    
    @Autowired
    private AdminRepo adminRepo;
    
    @GetMapping("") 
    public String adminlogin(HttpSession session) {
    	session.invalidate();
        return "adminlogin"; 
    }
    
    @PostMapping("/validateadmin") 
    public String login(HttpSession session, Admin admin) {
        
    	Admin loginadmin = new Admin();
    	loginadmin = adminRepo.getById(admin.getAdminId());
    	
    	if(loginadmin.getAdminPassword().equals(admin.getAdminPassword())) {
    		session.setAttribute("userName", loginadmin.getAdminName());
    		return "redirect:/admin/adboard";
    	}
    	else {
    		return "redirect:/admin/login";
    	}
    	   
    }
    
    @GetMapping("/adboard") 
    public ModelAndView adboard(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        
        if (session.getAttribute("userName") != null) {
        	
        	List<Problems> problems = problemRepo.findAll();
        	mv.addObject("problems", problems);
            mv.setViewName("allcompliants");
            
        } else {
            
            mv.setViewName("redirect:/admin/login");
        }
        return mv;
    }
    
    @PostMapping("/viewcomplaint")
    public ModelAndView viewComplaint(int probId) {
    	Problems pr = new Problems();
    	pr = problemRepo.getById(probId);
    	if(pr.getProbstatus()==null) {
    		pr.setProbstatus("Status not updated");
    	}
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("problem", pr);
    	mv.setViewName("viewcomplaint");
    	return mv;
    	
    }
    @PostMapping("/updatestatus")
    public ModelAndView updateStatus(Integer probId) {
    	System.out.println(probId);
    	Problems pr = new Problems();
    	pr = problemRepo.getById(probId);
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("problem", pr);
    	mv.setViewName("updatestatus");
    	return mv;
    	
    }
    @PostMapping("/updatenewstatus")
    public ModelAndView updateNewStatus(Problems problem) {
    	Problems pr = problemRepo.getById(problem.getProbid()); 
    	pr.setProbstatus(problem.getProbstatus());
    	problemRepo.save(pr);
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redirect:/admin/adboard");
    	return mv;
    	
    }
    
}
