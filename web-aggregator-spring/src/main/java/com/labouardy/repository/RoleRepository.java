package com.labouardy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.labouardy.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

	Role findRoleByName(String name);

}
