package com.gameplay.gameplaybackend.dtos

import com.fasterxml.jackson.annotation.JsonIgnore

abstract  class BaseResponse (
    val isSuccess:Boolean,
    val message:String,
    @JsonIgnore
    val statusCode:Int? = null
)