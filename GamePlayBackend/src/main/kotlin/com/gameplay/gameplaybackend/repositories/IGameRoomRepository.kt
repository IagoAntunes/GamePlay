package com.gameplay.gameplaybackend.repositories

import com.gameplay.gameplaybackend.models.GameRoomModel
import org.springframework.data.jpa.repository.JpaRepository

interface IGameRoomRepository : JpaRepository<GameRoomModel,Long>{



}