package com.gameplay.gameplaybackend.services

import com.gameplay.gameplaybackend.dtos.*
import com.gameplay.gameplaybackend.dtos.responses.*
import com.gameplay.gameplaybackend.infra.security.TokenService
import com.gameplay.gameplaybackend.models.RoleModel
import com.gameplay.gameplaybackend.models.UserModel
import com.gameplay.gameplaybackend.models.UserTokenModel
import com.gameplay.gameplaybackend.repositories.IRolesRepository
import com.gameplay.gameplaybackend.repositories.IUserRepository
import com.gameplay.gameplaybackend.repositories.IUserTokenRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Lazy
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import java.text.SimpleDateFormat
import java.util.*

@Service
class AuthService  : UserDetailsService{

    @Lazy
    @Autowired
    private lateinit var authManager: AuthenticationManager

    @Autowired
    private lateinit var userRepository: IUserRepository

    @Autowired
    private lateinit var userTokenRepository: IUserTokenRepository

    @Autowired
    private lateinit var tokenService: TokenService

    @Autowired
    private lateinit var roleRepository: IRolesRepository

    override fun loadUserByUsername(username: String?): UserDetails {
        val user = userRepository.findByUsername(username) ?: throw Exception("User not found")
        return user
    }

    fun loginUser(username: String, password: String): IBaseResponse {
        val result: LoginResponseDto?
         try {
            val usernamePassword = UsernamePasswordAuthenticationToken(username, password)
            val auth = authManager.authenticate(usernamePassword)
            val token = tokenService.generateToken(auth.principal as UserModel)

             _generateUserToken(auth.principal as UserModel,token)

             result = LoginResponseDto(
                 (auth.principal as UserModel).id,
                 (auth.principal as UserModel).userName,
                 token,
                 true,
                    "Login efetuado com sucesso"
             )
            return result
         } catch (e: Exception) {
            return FailureResponse("Usuário ou senha inválidos")
        }
    }

    fun registerUser(username:String,password: String,idRole:Long) : IBaseResponse {
        try {
            val userAlreadyExists = this.userRepository.findByUsername(username)
            if(userAlreadyExists != null){
                return FailureResponse("Usuário já existe")
            }
            val encryptPassword = BCryptPasswordEncoder().encode(password)
            val user = UserModel()
            user.userName = username
            user.passwordUser = encryptPassword
            val role = roleRepository.findRoleById(idRole)
            user.role = role
            this.userRepository.save(user)
            return RegisterResponseDto(UserDto(user.id,user.userName, RoleDto(role.name)),"Usuario criado com sucesso",true)
        }catch (e:Exception){
            return FailureResponse()
        }
    }

    fun refreshToken(token: String): IBaseResponse {
        try {
            val expiresInToken = tokenService.getExpiresAtFromToken(token)
            val sdf = SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH)
            val tokenExpirationDate = sdf.parse(expiresInToken)
            val currentDate = Date()
            val differenceInMilliseconds = tokenExpirationDate.time - currentDate.time
            val differenceInHours = differenceInMilliseconds / (1000 * 60 * 60)

             if (differenceInHours < 0) {
                val userDetail = userRepository.findByUsername(tokenService.getSubject(token))!!
                val user = UserModel()
                user.userName = userDetail.username
                user.role = userDetail.authorities.first() as RoleModel
                val newToken = tokenService.generateToken(user)
                return RefreshTokenResponseDto(newToken, "Token atualizado com sucesso.", true)
            }
            return RefreshTokenResponseDto(token, "Token ainda é valido", true)
        }catch (e:Exception){
            return FailureResponse("Token Invalido",401)
        }
    }

    private fun _generateUserToken(user:UserModel,token:String){
        var userToken = userTokenRepository.findUserTokenModelByUserId(user.id)
        if(userToken == null){
            userToken = UserTokenModel()
            userToken.userId = user.id
            userToken.token = token
        }else{
            userToken.token = token
        }
        userTokenRepository.save(userToken)
    }


}