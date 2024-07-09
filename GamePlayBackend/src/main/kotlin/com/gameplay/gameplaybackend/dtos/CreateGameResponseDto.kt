package com.gameplay.gameplaybackend.dtos

 class CreateGameResponseDto (
    val game:GameDto,
    message:String,
    isSucess:Boolean,
) : BaseResponse(isSucess,message)