package com.gameplay.gameplaybackend.dtos

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude

@JsonInclude(JsonInclude.Include.NON_NULL)
abstract  class BaseResponse (
    val isSuccess:Boolean,
    val message:String,
    @JsonIgnore
    val statusCode:Int? = null
)