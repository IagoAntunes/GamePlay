package com.gameplay.gameplaybackend.dtos

class FailureResponse(message:String? = null,statusCode:Int? = null) :BaseResponse(false,message?: "Erro interno",statusCode){
}