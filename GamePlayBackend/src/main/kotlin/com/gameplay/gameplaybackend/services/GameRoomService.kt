package com.gameplay.gameplaybackend.services

import com.gameplay.gameplaybackend.dtos.*
import com.gameplay.gameplaybackend.dtos.responses.BaseResponse
import com.gameplay.gameplaybackend.dtos.responses.FailureResponse
import com.gameplay.gameplaybackend.dtos.responses.IBaseResponse
import com.gameplay.gameplaybackend.infra.security.TokenService
import com.gameplay.gameplaybackend.models.GameRoomModel
import com.gameplay.gameplaybackend.models.GameRoomPlayersModel
import com.gameplay.gameplaybackend.models.UserModel
import com.gameplay.gameplaybackend.repositories.IGameRoomPlayersRepository
import com.gameplay.gameplaybackend.repositories.IGameRoomRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class GameRoomService {

    @Autowired
    private lateinit var tokenService:TokenService

    @Autowired
    private lateinit var authService:AuthService

    @Autowired
    private  lateinit var  gameRoomRepository:IGameRoomRepository

    @Autowired
    private lateinit var gameRoomPlayersRepository:IGameRoomPlayersRepository


    fun createGameRoom(
        date:String,
        description:String,
        idGame:Long,
        idCategory:Long,
        idUserOwner:Long,
        token:String) : IBaseResponse {
        try {
            val username = tokenService.getSubject(token)

            val user:UserModel = authService.loadUserByUsername(username) as UserModel

            val gameRoomModel = GameRoomModel()
            gameRoomModel.date = date
            gameRoomModel.description = description
            gameRoomModel.idGame = idGame
            gameRoomModel.idCategory = idCategory
            gameRoomModel.idUserOwner = user.id
            val gameRoomCreated = gameRoomRepository.save(gameRoomModel)

            return BaseResponse(gameRoomCreated.id,true,"Sala de jogo criada com sucesso")
        }catch (e:Exception){
            return FailureResponse("Erro ao criar sala de jogo")
        }
    }

    fun getAllGameRooms(): List<GameRoomDto> {
        val listGameRoomModel = gameRoomRepository.findAll()
        val listGameRoomDto = mutableListOf<GameRoomDto>()
        listGameRoomModel.forEach {
            listGameRoomDto.add(
                GameRoomDto(
                    it.id,
                    it.date,
                    it.description,
                    it.idGame,
                    CategoryDto(it.category!!.id,it.category.name,it.category.imageUrl),
                    UserDto(it.userOwner!!.id,it.userOwner!!.userName),
                    GameDto(it.game!!.id,it.game.name,it.game.imageUrl),
                    it.listPlayers.map {
                        player ->
                        GameRoomPlayersDto(
                            player.id,
                            UserDto(player.user.id,player.user.userName)
                        )
                    }
                )
            )
        }
        return listGameRoomDto
    }

    fun enterGameRoom(idGameRoom: Long, idUser: Long): String? {
        try {
            val gameRoomPlayersModel:GameRoomPlayersModel = GameRoomPlayersModel()
            gameRoomPlayersModel.idGameRoom = idGameRoom
            gameRoomPlayersModel.idUser = idUser

            gameRoomPlayersRepository.save(gameRoomPlayersModel)
            return ""
        }catch (e: Exception){
            return null
        }
    }

}