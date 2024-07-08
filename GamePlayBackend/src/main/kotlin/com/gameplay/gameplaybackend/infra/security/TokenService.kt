package com.gameplay.gameplaybackend.infra.security

import com.auth0.jwt.JWT
import com.auth0.jwt.algorithms.Algorithm
import com.auth0.jwt.exceptions.JWTCreationException
import com.auth0.jwt.exceptions.JWTVerificationException
import com.gameplay.gameplaybackend.models.UserModel
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Service
import java.time.LocalDate
import java.time.ZoneId
import java.util.*

@Service
class TokenService {

    @Value("\${security.jwt.token.secret-key:secret}")
    val secret: String = "secret"

    //Responsavel por GERAR o token
    fun generateToken(user:UserModel):String{
        try {
            val algorithm:Algorithm = Algorithm.HMAC256(secret)
            val token = JWT.create()
                .withIssuer("AuthApi")//CRIADOR DO TOKEN
                .withSubject(user.userName)//QUEM ESTÁ USANDO O TOKEN
                .withExpiresAt(
                    Date.from(LocalDate.now().plusDays(2).atStartOfDay(ZoneId.systemDefault()).toInstant()))
                .sign(algorithm)
            return token
        }catch (e:JWTCreationException){
            throw RuntimeException("aaa")
        }
    }

    fun validateToken(token:String): String{
        val algorithm:Algorithm = Algorithm.HMAC256(secret)
        try{
            return JWT.require(algorithm)
                .withIssuer("AuthApi")
                .build()
                .verify(token)//Descriptografa
                .subject
        }catch (e:JWTVerificationException){
            return ""
        }
    }


}