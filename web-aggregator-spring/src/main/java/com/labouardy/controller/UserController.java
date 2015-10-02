package com.labouardy.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.labouardy.entity.Blog;
import com.labouardy.entity.User;
import com.labouardy.service.BlogService;
import com.labouardy.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BlogService blogService;
	
	@ModelAttribute("user")
	public User constructUser(){
		return new User();
	}
	
	@ModelAttribute("blog")
	public Blog constructBlog(){
		return new Blog();
	}
	
	@RequestMapping("/users")
	public String users(Model model){
		model.addAttribute("users", userService.findAll());
		return "users";
	}
	
	@RequestMapping("/users/{id}")
	public String detail(Model model, @PathVariable int id){
		model.addAttribute("user",userService.findOneWithBlogs(id));
		return "user-detail";
	}
	
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String signUP(@Valid @ModelAttribute("user") User user, BindingResult result){
		if(result.hasErrors()){
			return "register";
		}
		userService.save(user);
		return "redirect:/register.html?success=true";
	}
	
	@RequestMapping("/profile")
	public String profile(Model model, Principal principal){
		String name=principal.getName();
		model.addAttribute("user",userService.findOneWithBlogs(name));
		return "user-detail";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String addBlog(@ModelAttribute("blog") Blog blog, Principal principal){
		String name=principal.getName();
		blogService.save(blog, name);
		return "redirect:/profile.html";
	}
	
	@RequestMapping("/blog/delete/{id}")
	public String deleteBlog(@PathVariable int id){
		Blog blog=blogService.findOne(id);
		blogService.delete(blog);
		return "redirect:/profile.html";
	}
	
	@RequestMapping("/user/delete/{id}")
	public String deleteUser(@PathVariable int id){
		userService.delete(id);
		return "redirect:/users.html";
	}
}
