package com.gameplay.gameplaybackend.dtos.responses

class FailureResponse(message:String? = null,statusCode:Int? = null) :
    IBaseResponse(false,message?: "Erro interno",statusCode){
}