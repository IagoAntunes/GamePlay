package com.gameplay.gameplaybackend.dtos.responses

import com.gameplay.gameplaybackend.dtos.GameDto

class CreateGameResponseDto (
    val game: GameDto,
    message:String,
    isSucess:Boolean,
) : IBaseResponse(isSucess,message)