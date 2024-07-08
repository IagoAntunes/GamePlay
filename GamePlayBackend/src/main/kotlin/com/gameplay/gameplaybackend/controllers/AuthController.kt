package com.gameplay.gameplaybackend.controllers

import com.gameplay.gameplaybackend.dtos.LoginRequest
import com.gameplay.gameplaybackend.dtos.LoginResponseDto
import com.gameplay.gameplaybackend.dtos.RegisterRequestDto
import com.gameplay.gameplaybackend.infra.security.TokenService
import com.gameplay.gameplaybackend.models.UserModel
import com.gameplay.gameplaybackend.repositories.IRolesRepository
import com.gameplay.gameplaybackend.repositories.IUserRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping

import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/auth")
class AuthController {

    @Autowired
    private lateinit var tokenService: TokenService

    @Autowired
    private lateinit var authenticationManager: AuthenticationManager

    @Autowired
    private lateinit var userRepository: IUserRepository
    @Autowired

    private lateinit var roleRepository: IRolesRepository


    @PostMapping("/login")
    fun login(@RequestBody request:LoginRequest): ResponseEntity<LoginResponseDto>{

        val usernamePassword =  UsernamePasswordAuthenticationToken(request.username, request.password)
        val auth = authenticationManager.authenticate(usernamePassword)
        val token = tokenService.generateToken(auth.principal as UserModel)

        val response = LoginResponseDto(token)
        return ResponseEntity.ok().body(response)
    }

    @PostMapping("/register")
    fun register(@RequestBody request:RegisterRequestDto) : ResponseEntity<String>{
        if(this.userRepository.findByUsername(request.username) != null){
            return ResponseEntity.badRequest().body("awdaw")
        }
        val encryptPassword = BCryptPasswordEncoder().encode(request.password)
        val user = UserModel()
        user.userName = request.username
        user.passwordUser = encryptPassword

        val role = roleRepository.findRoleById(request.role)
        user.role = role
        //Salva no bd
        this.userRepository.save(user)
        return ResponseEntity.ok().body("USUARIO CRIADO com sucesso")
    }


}