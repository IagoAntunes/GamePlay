package com.gameplay.gameplaybackend.dtos.responses

class LoginResponseDto(
    var id:Long = 0,
    var username:String = "",
    var token:String = "",
    isSuccess:Boolean,
    message:String
) : IBaseResponse(isSuccess,message)