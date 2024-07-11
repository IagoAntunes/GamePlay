package com.gameplay.gameplaybackend.dtos.responses

import com.fasterxml.jackson.annotation.JsonInclude

@JsonInclude(JsonInclude.Include.NON_NULL)
 class BaseResponse<T>(
     val result:T,
    isSuccess:Boolean,
    message:String
) : IBaseResponse(isSuccess,message)