package com.gameplay.gameplaybackend.dtos

data class UserDto (
    val id: Long? = null,
    val name:String,
    val role:RoleDto,
)