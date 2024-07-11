package com.gameplay.gameplaybackend.controllers

import com.gameplay.gameplaybackend.dtos.EnterGameRoomRequestDto
import com.gameplay.gameplaybackend.dtos.requests.CreateGameRoomRequestDto
import com.gameplay.gameplaybackend.dtos.responses.BaseResponse
import com.gameplay.gameplaybackend.dtos.responses.FailureResponse
import com.gameplay.gameplaybackend.dtos.responses.IBaseResponse
import com.gameplay.gameplaybackend.services.GameRoomService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestHeader
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.util.UriComponentsBuilder


@RestController
@RequestMapping("/gameRoom")
class GameRoomController {

    @Autowired
    private lateinit var gameRoomService: GameRoomService


    @GetMapping("/getAll")
    fun getAllGameRooms() : ResponseEntity<IBaseResponse>{
        val result = gameRoomService.getAllGameRooms()
        return ResponseEntity.ok().body(BaseResponse(result,true,"Lista de salas de jogo"))
    }

    @PostMapping("/create")
    fun createGameRoom(
        @RequestBody request: CreateGameRoomRequestDto,
        @RequestHeader("Authorization") authorizationHeader:String?,
        uriBuilder:UriComponentsBuilder
    ) : ResponseEntity<IBaseResponse>{
        if(authorizationHeader == null){
            return ResponseEntity.badRequest().build()
        }
        val result = gameRoomService.createGameRoom(
            request.date,
            request.description,
            request.idGame,
            request.idCategory,
            request.idUserOwner,
            authorizationHeader.substring("Bearer ".length)
        )
        if(result is FailureResponse){
            return ResponseEntity.badRequest().build()
        }
        val uri = uriBuilder.path("/gameRoom/${(result as BaseResponse<*>).result}").build().toUri()
        return ResponseEntity.created(uri).body(BaseResponse(null,true,"Sala de jogo criada com sucesso"))

    }

    @PostMapping("/enter")
    fun enterGameRoom(
        @RequestBody request: EnterGameRoomRequestDto,
        uriBuilder:UriComponentsBuilder
    ) : ResponseEntity<IBaseResponse>{
        var result = gameRoomService.enterGameRoom(request.idGameRoom,request.idUser)

        if(result == null){
            return ResponseEntity.badRequest().build()
        }

        val uri = uriBuilder.path(("/gameRoom/${request.idGameRoom}")).build().toUri()
        return ResponseEntity.created(uri).body(BaseResponse(null,true,"Entrou na sala de jogo"))
    }

}