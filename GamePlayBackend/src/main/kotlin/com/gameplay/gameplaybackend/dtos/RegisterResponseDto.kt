package com.gameplay.gameplaybackend.dtos

class RegisterResponseDto(
    val user: UserDto,
    message:String,
    isSuccess:Boolean,
) : BaseResponse(isSuccess,message)