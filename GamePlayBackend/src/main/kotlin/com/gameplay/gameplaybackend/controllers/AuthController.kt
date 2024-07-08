package com.gameplay.gameplaybackend.controllers

import com.gameplay.gameplaybackend.dtos.LoginRequest
import com.gameplay.gameplaybackend.dtos.RegisterRequestDto
import com.gameplay.gameplaybackend.services.AuthService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Lazy
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping

import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/auth")
class AuthController {

    @Lazy
    @Autowired
    private lateinit var authService:AuthService

    @PostMapping("/login")
    fun login(@RequestBody request:LoginRequest): ResponseEntity<Any>{
        val result = authService.loginUser(request.username, request.password)
        val statusCode:Int = result.statusCode ?: if (result.isSuccess) HttpStatus.OK.value() else HttpStatus.BAD_REQUEST.value()
        return ResponseEntity.status(statusCode).body(result)
    }

    @PostMapping("/register")
    fun register(@RequestBody request:RegisterRequestDto) : ResponseEntity<Any>{
        val result = authService.registerUser(request.username,request.password,request.role)
        val statusCode:Int = result.statusCode ?: if (result.isSuccess) HttpStatus.OK.value() else HttpStatus.BAD_REQUEST.value()
        return ResponseEntity.status(statusCode).body(result)
    }

}