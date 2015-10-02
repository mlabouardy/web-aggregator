package com.labouardy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.labouardy.entity.Item;
import com.labouardy.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
