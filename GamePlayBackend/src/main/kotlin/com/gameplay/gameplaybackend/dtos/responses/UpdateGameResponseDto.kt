package com.gameplay.gameplaybackend.dtos.responses

import com.gameplay.gameplaybackend.dtos.GameDto

class UpdateGameResponseDto(
    val game: GameDto,
    message:String,
    isSuccess:Boolean
) : IBaseResponse(isSuccess,message){
}