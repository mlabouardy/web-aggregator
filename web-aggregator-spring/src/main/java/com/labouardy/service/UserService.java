package com.labouardy.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.labouardy.entity.Blog;
import com.labouardy.entity.User;
import com.labouardy.repository.BlogRepository;
import com.labouardy.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	public List<User> findAll(){
		return userRepository.findAll();
	}

	public User findOne(int id) {
		List<User> users=findAll();
		for(User user:users){
			if(user.getId()==id)
				return user;
		}
		return null;
	}

	public User findOneWithBlogs(int id) {
		User user=findOne(id);
		List<Blog> blogs=blogRepository.findByUser(user, new PageRequest(0, 10, Direction.ASC, "name"));
		user.setBlogs(blogs);
		return user;
	}

	public void save(User user) {
		userRepository.save(user);
	}
}
