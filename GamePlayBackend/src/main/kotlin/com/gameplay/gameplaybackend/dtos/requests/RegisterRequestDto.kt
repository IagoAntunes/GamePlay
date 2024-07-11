package com.gameplay.gameplaybackend.dtos.requests

data class RegisterRequestDto(
    val username:String,
    val password:String,
    val role:Long
)