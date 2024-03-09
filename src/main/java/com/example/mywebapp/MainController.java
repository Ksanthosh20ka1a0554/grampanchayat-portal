package com.example.mywebapp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
    
	@Autowired
    private UserRepository userRepo;
	@Autowired
	private ProblemRepository problemRepo;
	
    @RequestMapping("/")
    public String index() {
        return "index";
    }
    
    @RequestMapping("/error404")
    public String error404() {
        return "404page";
    }

    @RequestMapping("/login")
    public String login(HttpSession session) {
    	session.invalidate();
        return "login";
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userId");
        session.invalidate();
        return "redirect:/login";
    }
    
    @PostMapping("/validateuser")
    public String validateuser(Users user,HttpSession session, Model model) {
    	
    		Users loginuser = userRepo.getById(user.getEmail());
    		if (loginuser != null && loginuser.getPassword().equals(user.getPassword())) {
    			session.setAttribute("userId", loginuser.getEmail());
            	session.setAttribute("userName", loginuser.getFname());
                return "redirect:/udboard";
    		}
    		else {
                return "redirect:/login";
    		}
    	
    }
    
    @RequestMapping("/signup")
    public String signUp() {
       return "signup";
    }
    
    @PostMapping("/register")
    public String register(HttpSession session, Users user) {
    	if(userRepo.save(user) != null) {
    		session.setAttribute("userId", user.getEmail());
    		return "redirect:/udboard";
    	}
    	else {
    		return "signup";
    	}
    	
    	
    }
    
    @RequestMapping("/udboard")
    public ModelAndView udboard(HttpSession session) {
    	String userId = (String) session.getAttribute("userId");
    	if(userId!=null) {
    		ModelAndView mv = new ModelAndView();
        	List<Problems> problems = problemRepo.findByuserid(userId);
        	mv.addObject("problems", problems);
        	mv.setViewName("udboard");
        	return mv;
    	}
    	else {
    		ModelAndView mv = new ModelAndView();
    		mv.setViewName("redirect:/login");
    		return mv;
    	}
    	
    	
    }
    
    @PostMapping("/registercomplaint")
    public String registerComplaint(HttpSession session, Problems problem) {
    	
    	String userId = (String) session.getAttribute("userId");
    	problem.setUserid(userId);
    	problemRepo.save(problem);
    	
    	return "redirect:/udboard";
    	
    }
    @PostMapping("/problemstatus")
    public ModelAndView problemStatus(int probId) {
    	Problems pr = new Problems();
    	pr = problemRepo.getById(probId);
    	
    	if(pr.getProbstatus()==null) {
    		pr.setProbstatus("Status not updated");
    	}
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("problem", pr);
    	mv.setViewName("problemstatus");
    	return mv;
    	
    }
    
    
}
