package com.gameplay.gameplaybackend.services

import com.gameplay.gameplaybackend.repositories.IUserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.stereotype.Service

@Service
class UserService  : UserDetailsService{

    @Autowired
    private lateinit var userRepository: IUserRepository


    override fun loadUserByUsername(username: String?): UserDetails {
        val user = userRepository.findByUsername(username) ?: throw Exception("User not found")
        return user
    }
}