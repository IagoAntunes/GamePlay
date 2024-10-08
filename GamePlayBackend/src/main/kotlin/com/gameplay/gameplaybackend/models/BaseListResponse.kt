package com.gameplay.gameplaybackend.models

import com.gameplay.gameplaybackend.dtos.responses.IBaseResponse

 class BaseListResponse<T>(
    val list:List<T>,
     message:String,
    isSuccess:Boolean
) : IBaseResponse(isSuccess,message)