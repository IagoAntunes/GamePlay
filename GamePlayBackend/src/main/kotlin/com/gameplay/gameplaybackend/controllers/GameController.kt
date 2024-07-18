package com.gameplay.gameplaybackend.controllers

import com.gameplay.gameplaybackend.dtos.*
import com.gameplay.gameplaybackend.dtos.requests.CreateGameRequestDto
import com.gameplay.gameplaybackend.dtos.requests.UpdateGameRequestDto
import com.gameplay.gameplaybackend.dtos.responses.CreateGameResponseDto
import com.gameplay.gameplaybackend.dtos.responses.GetGameByIdResponseDto
import com.gameplay.gameplaybackend.dtos.responses.IBaseResponse
import com.gameplay.gameplaybackend.dtos.responses.UpdateGameResponseDto
import com.gameplay.gameplaybackend.models.BaseListResponse
import com.gameplay.gameplaybackend.services.GamesService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.util.UriComponentsBuilder


@RestController
@RequestMapping("/games")
class GameController {

    @Autowired
    lateinit var gamesService:GamesService

    @GetMapping()
    fun getGames() : ResponseEntity<BaseListResponse<GameDto>>{
        val result = gamesService.getAllGames()

        val response = BaseListResponse(result,"Jogos consultados com sucesso",true)

        return ResponseEntity.ok().body(response)
    }

    @GetMapping("/{id}")
    fun getGameById(@PathVariable(name = "id") id: Long): ResponseEntity<IBaseResponse>{
        val result = gamesService.getGameById(id)
        if(result != null){
            val response = GetGameByIdResponseDto(result,"Jogo consultado com sucesso",true)
            return ResponseEntity.ok().body(response)
        }
        return ResponseEntity.notFound().build()

    }

    @PostMapping("/create")
    fun createGame(
        @RequestBody request: CreateGameRequestDto,
        uriBuilder:UriComponentsBuilder) : ResponseEntity<IBaseResponse>{
        val result = gamesService.createGame(request.name,request.imageUrl,request.bannerUrl)
        val uri = uriBuilder.path("/games/${result.id}").build().toUri()
        val response = CreateGameResponseDto(GameDto(result.id,result.name,result.description,result.imageUrl,result.bannerUrl),"Jogos consultados com sucesso",true)
        return ResponseEntity.created(uri).body(response)
    }

    @PutMapping("/update")
    fun updateGame(
        @RequestBody request: UpdateGameRequestDto,
        uriBuilder:UriComponentsBuilder,
        ) : ResponseEntity<IBaseResponse>{
        val result = gamesService.updateGame(request.id,request.name,request.imageUrl)
        if(result != null){
            val uri = uriBuilder.path("/games/${result.id}").build().toUri()
            val response = UpdateGameResponseDto(result,"Jogo atualizado com sucesso",true)
            return ResponseEntity.created(uri).body(response)
        }
        return ResponseEntity.notFound().build()
    }

}