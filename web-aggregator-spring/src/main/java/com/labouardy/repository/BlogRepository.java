package com.labouardy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.labouardy.entity.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

}
