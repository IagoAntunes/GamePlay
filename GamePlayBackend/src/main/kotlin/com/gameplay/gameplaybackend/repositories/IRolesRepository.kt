package com.gameplay.gameplaybackend.repositories

import com.gameplay.gameplaybackend.models.RoleModel
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query

interface IRolesRepository : JpaRepository<RoleModel, Long>{

    @Query("SELECT r FROM RoleModel r WHERE r.id = :idRole")
    fun findRoleById(idRole:Long): RoleModel

}