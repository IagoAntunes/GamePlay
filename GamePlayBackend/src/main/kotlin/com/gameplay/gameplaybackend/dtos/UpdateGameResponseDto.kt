package com.gameplay.gameplaybackend.dtos

class UpdateGameResponseDto(
    val game:GameDto,
    message:String,
    isSuccess:Boolean
) : BaseResponse(isSuccess,message){
}