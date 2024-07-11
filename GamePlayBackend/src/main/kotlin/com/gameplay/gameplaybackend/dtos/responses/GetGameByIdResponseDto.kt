package com.gameplay.gameplaybackend.dtos.responses

import com.gameplay.gameplaybackend.dtos.GameDto

class GetGameByIdResponseDto(
    val result: GameDto,
    message: String,
    isSuccess: Boolean) : IBaseResponse(isSuccess,message) {
}
