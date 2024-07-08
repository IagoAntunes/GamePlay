package com.gameplay.gameplaybackend.repositories

import com.gameplay.gameplaybackend.models.UserModel
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.security.core.userdetails.UserDetails

interface IUserRepository : JpaRepository<UserModel,Long> {

    @Query("SELECT u FROM UserModel u WHERE u.userName = :username")
    fun findByUsername(username: String?): UserDetails?

}