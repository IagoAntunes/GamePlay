package com.gameplay.gameplaybackend.controllers

import com.gameplay.gameplaybackend.dtos.GameDto
import com.gameplay.gameplaybackend.services.GamesService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/games")
class GameController {

    @Autowired
    lateinit var gamesService:GamesService

    @GetMapping()
    fun getGames() : ResponseEntity<MutableList<GameDto>>{
        val result = gamesService.findAll()
        return ResponseEntity.ok().body(result)
    }

}