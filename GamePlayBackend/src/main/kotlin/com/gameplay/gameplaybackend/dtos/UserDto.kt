package com.gameplay.gameplaybackend.dtos

import com.fasterxml.jackson.annotation.JsonInclude

@JsonInclude(JsonInclude.Include.NON_NULL)
data class UserDto (
    val id: Long? = null,
    val name:String,
    val role:RoleDto? = null,
)