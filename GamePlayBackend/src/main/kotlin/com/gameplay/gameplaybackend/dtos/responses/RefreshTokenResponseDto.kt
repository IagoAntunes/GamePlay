package com.gameplay.gameplaybackend.dtos.responses

class RefreshTokenResponseDto(
    val newToken:String,
    message:String,
    isSuccess:Boolean,
) : IBaseResponse(isSuccess,message) {
}