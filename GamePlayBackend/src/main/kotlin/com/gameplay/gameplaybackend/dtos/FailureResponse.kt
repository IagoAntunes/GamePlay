package com.gameplay.gameplaybackend.dtos

class FailureResponse(message:String? = null) :BaseResponse(false,message?: "Erro interno"){
}