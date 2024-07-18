package com.gameplay.gameplaybackend.services

import com.gameplay.gameplaybackend.dtos.GameDto
import com.gameplay.gameplaybackend.models.GameModel
import com.gameplay.gameplaybackend.repositories.IGamesRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class GamesService {

    @Autowired
    private lateinit var _gameRepository:IGamesRepository

    fun getAllGames() : MutableList<GameDto>{
        val listGames = _gameRepository.findAll()
        val list:MutableList<GameDto> = mutableListOf()
        for(game in listGames){
            list.add(GameDto(game.id,game.name,game.description,game.imageUrl,game.bannerUrl))
        }
        return list
    }

    fun createGame(name: String, imageUrl: String,bannerUrl:String): GameDto {
        val gameModel:GameModel = GameModel()
        gameModel.name = name
        gameModel.imageUrl = imageUrl
        val result = _gameRepository.save(gameModel)
        return GameDto(result.id,result.name,result.description,result.imageUrl,result.bannerUrl)
    }

    fun updateGame(id: Long, name: String, imageUrl: String): GameDto? {
        try {
            val gameModel = _gameRepository.findById(id)
            gameModel.ifPresent {
                it.name = name
                it.imageUrl = imageUrl
                _gameRepository.save(it)
            }
            return GameDto(gameModel.get().id,gameModel.get().name,gameModel.get().description,gameModel.get().imageUrl,gameModel.get().bannerUrl)
        }catch (e: NoSuchElementException){
            return null
        }
    }

    fun getGameById(id: Long): GameDto? {
        try {
            val gameModel = _gameRepository.findById(id)
            return GameDto(gameModel.get().id,gameModel.get().name,gameModel.get().description,gameModel.get().imageUrl,gameModel.get().bannerUrl)
        }catch (e:NoSuchElementException){
            return null
        }
    }

}