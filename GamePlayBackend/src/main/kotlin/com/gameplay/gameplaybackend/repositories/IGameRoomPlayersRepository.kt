package com.gameplay.gameplaybackend.repositories

import com.gameplay.gameplaybackend.models.GameRoomPlayersModel
import org.springframework.data.jpa.repository.JpaRepository

interface IGameRoomPlayersRepository : JpaRepository<GameRoomPlayersModel,Long> {
}