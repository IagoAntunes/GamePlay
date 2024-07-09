package com.gameplay.gameplaybackend.dtos

class GetGameByIdResponseDto(
    val result: GameDto,
    message: String,
    isSuccess: Boolean) : BaseResponse(isSuccess,message) {
}
