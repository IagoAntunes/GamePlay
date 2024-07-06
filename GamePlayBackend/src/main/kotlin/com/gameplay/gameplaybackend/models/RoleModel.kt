package com.gameplay.gameplaybackend.models

import jakarta.persistence.*
import org.springframework.security.core.GrantedAuthority

@Entity
@Table(name = "roles")
class RoleModel : GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0

    @Column(name = "name", nullable = false)
    var name:String = ""
    override fun getAuthority(): String = name
}