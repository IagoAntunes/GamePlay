package com.gameplay.gameplaybackend.repositories

import com.gameplay.gameplaybackend.models.UserTokenModel
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query

interface IUserTokenRepository : JpaRepository<UserTokenModel,Long> {

    @Query("SELECT ut FROM UserTokenModel ut WHERE ut.userId = :userId")
    fun findUserTokenModelByUserId(userId:Long):UserTokenModel?

}