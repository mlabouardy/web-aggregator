package com.labouardy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.labouardy.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {

}
