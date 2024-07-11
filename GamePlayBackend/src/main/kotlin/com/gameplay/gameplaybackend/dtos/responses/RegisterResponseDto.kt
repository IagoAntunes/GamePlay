package com.gameplay.gameplaybackend.dtos.responses

import com.gameplay.gameplaybackend.dtos.UserDto

class RegisterResponseDto(
    val user: UserDto,
    message:String,
    isSuccess:Boolean,
) : IBaseResponse(isSuccess,message)