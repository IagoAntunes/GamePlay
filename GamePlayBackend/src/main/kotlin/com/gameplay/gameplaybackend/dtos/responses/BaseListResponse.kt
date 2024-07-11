package com.gameplay.gameplaybackend.dtos.responses

 class BaseListResponse<T>(
    var result:List<T>,
    isSuccess:Boolean,
    message:String
    ) : IBaseResponse(isSuccess,message)