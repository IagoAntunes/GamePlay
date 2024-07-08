package com.gameplay.gameplaybackend.repositories

import com.gameplay.gameplaybackend.models.GameModel
import org.springframework.data.jpa.repository.JpaRepository

interface IGamesRepository : JpaRepository<GameModel,Long> {
}