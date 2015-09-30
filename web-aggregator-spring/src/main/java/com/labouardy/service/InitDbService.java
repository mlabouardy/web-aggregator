package com.labouardy.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.labouardy.entity.Blog;
import com.labouardy.entity.Role;
import com.labouardy.entity.User;
import com.labouardy.repository.BlogRepository;
import com.labouardy.repository.ItemRepository;
import com.labouardy.repository.RoleRepository;
import com.labouardy.repository.UserRepository;

@Transactional
@Service
public class InitDbService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository; 
	
	@Autowired
	private UserRepository userRepository;
	
	@PostConstruct
	public void init(){
		Role roleUser=new Role();
		roleUser.setName("ROLE_USER");
		roleRepository.save(roleUser);
		
		Role roleAdmin=new Role();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);
		
		User userAdmin=new User();
		userAdmin.setName("admin");
		userAdmin.setEmail("mohamed@labouardy.com");
		BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();
		userAdmin.setPassword(bCryptPasswordEncoder.encode("sinworm"));
		List<Role> listOfRoles=new ArrayList();
		listOfRoles.add(roleAdmin);
		userAdmin.setRoles(listOfRoles);
		userRepository.save(userAdmin);
		
		Blog blog=new Blog();
		blog.setName("Java");
		blog.setUrl("http://feeds.feedburner.com/javavids?format=xml");
		blog.setUser(userAdmin);
		blogRepository.save(blog);
		
		
		
	}
}
