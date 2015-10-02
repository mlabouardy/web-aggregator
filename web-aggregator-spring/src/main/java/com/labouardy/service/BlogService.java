package com.labouardy.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.labouardy.entity.Blog;
import com.labouardy.entity.User;
import com.labouardy.repository.BlogRepository;
import com.labouardy.repository.UserRepository;

@Service
@Transactional
public class BlogService {
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired 
	private UserRepository userRepository;

	public void save(Blog blog, String name) {
		User user=userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);

	}

	@PreAuthorize("#blog.user.name == authentication.name or hasRole('ROLE_ADMIN'")
	public void delete(@P("blog") Blog blog) {
		blogRepository.delete(blog);
	}

	public Blog findOne(int id) {
		return blogRepository.findOne(id);
	}
}
