package com.gameplay.gameplaybackend.services

import com.gameplay.gameplaybackend.dtos.GameDto
import com.gameplay.gameplaybackend.repositories.IGamesRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class GamesService {

    @Autowired
    private  lateinit var gameRepository:IGamesRepository

    fun findAll() : MutableList<GameDto>{
        val aux = gameRepository.findAll()
        val list:MutableList<GameDto> = mutableListOf()
        for(game in aux){
            list.add(GameDto(game.id,game.name,game.imageUrl))
        }
        return list
    }

}