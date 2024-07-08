package com.gameplay.gameplaybackend.dtos

data class RegisterRequestDto(
    val username:String,
    val password:String,
    val role:Long
)