package com.gameplay.gameplaybackend.infra.security

import com.gameplay.gameplaybackend.repositories.IUserRepository
import jakarta.servlet.FilterChain
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.stereotype.Component
import org.springframework.web.filter.OncePerRequestFilter

@Component
class SecurityFilter() : OncePerRequestFilter(){

    @Autowired
    private lateinit var tokenService: TokenService

    @Autowired
    private lateinit var userRepository: IUserRepository

    override fun doFilterInternal(
        request: HttpServletRequest,
        response: HttpServletResponse,
        filterChain: FilterChain
    ) {
        if(request.servletPath.equals("*/auth/login") || request.servletPath.equals("*/auth/register")){
            filterChain.doFilter(request, response)
            return
        }
        val token = this.recoverToken(request)
        if(token != null){
            val subject = tokenService.validateToken(token)
            val user:UserDetails = userRepository.findByUsername(subject)!!

            val authentication = UsernamePasswordAuthenticationToken(user,null,user.authorities)
            SecurityContextHolder.getContext().authentication = authentication
        }
        filterChain.doFilter(request,response)
    }

    private fun recoverToken(request: HttpServletRequest): String? {
        val token = request.getHeader("Authorization") ?: return null
        return token.replace("Bearer ","")
    }


}