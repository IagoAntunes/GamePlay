package com.gameplay.gameplaybackend.dtos.responses

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonInclude

@JsonInclude(JsonInclude.Include.NON_NULL)
abstract  class IBaseResponse (
    val isSuccess:Boolean,
    val message:String,
    @JsonIgnore
    val statusCode:Int? = null
)