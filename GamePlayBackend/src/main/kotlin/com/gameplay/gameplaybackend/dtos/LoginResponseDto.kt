package com.gameplay.gameplaybackend.dtos

 class LoginResponseDto(
    var id:Long = 0,
    var username:String = "",
    var token:String = "",
    isSuccess:Boolean,
    message:String
) : BaseResponse(isSuccess,message)