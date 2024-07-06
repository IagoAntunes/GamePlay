package com.gameplay.gameplaybackend.models

import jakarta.persistence.*
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

@Entity
@Table(name = "users")
class UserModel : UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0

    @Column(name =  "username", nullable = false)
     val userName:String = ""

    @Column(name =  "password", nullable = false)
    private var password:String = ""

    @Column(name = "role_id", nullable = false)
    val idRole: Long = 0

    override fun getPassword(): String {
        return this.password!!
    }

    override fun getUsername(): String {
        return this.userName!!
    }

    override fun getAuthorities(): Collection<GrantedAuthority> {
        val roleName = findRoleNameById(idRole)
        val role = RoleModel()
        role.name = roleName
        return listOf(role)
    }

    fun findRoleNameById(roleId: Long): String {
        return "ROLE_EXAMPLE"
    }

}