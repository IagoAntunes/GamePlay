package com.gameplay.gameplaybackend.models

import com.gameplay.gameplaybackend.dtos.BaseResponse

 class BaseListResponse<T>(
    val list:List<T>,
     message:String,
    isSuccess:Boolean
) : BaseResponse(isSuccess,message)