package com.gameplay.gameplaybackend.dtos

class RefreshTokenResponseDto(
    val newToken:String,
    message:String,
    isSuccess:Boolean,
) : BaseResponse(isSuccess,message) {
}