package com.gameplay.gameplaybackend.models

import com.fasterxml.jackson.annotation.JsonIgnore
import jakarta.persistence.*
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

@Entity
@Table(name = "users")
class UserModel : UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0

    @Column(name =  "username", nullable = false)
     var userName:String = ""

    @Column(name =  "password", nullable = false)
     var passwordUser:String = ""

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id")
    lateinit var role: RoleModel

    override fun getPassword(): String {
        return this.passwordUser
    }

    override fun getUsername(): String {
        return this.userName
    }

    override fun getAuthorities(): Collection<GrantedAuthority> {
        return listOf(SimpleGrantedAuthority(role.name))
    }

}