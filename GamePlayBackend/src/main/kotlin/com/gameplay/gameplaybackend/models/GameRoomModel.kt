package com.gameplay.gameplaybackend.models

import com.fasterxml.jackson.annotation.JsonManagedReference
import jakarta.persistence.*

@Entity
@Table(name = "gameroom")
class GameRoomModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0

    @Column( name = "id_category",nullable = false)
    var idCategory:Long = 0

    @Column(name = "id_game", nullable = false)
    var idGame:Long = 0

    @Column(name = "id_user_owner", nullable = false)
    var idUserOwner:Long = 0

    @Column(name = "date", nullable = false)
    var date:String = ""

    @Column(name = "description", nullable = false)
    var description:String = ""


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_category", referencedColumnName = "id", insertable = false, updatable = false)
    val category:CategoryModel? = null

    @OneToMany(mappedBy = "gameRoom",fetch = FetchType.EAGER)
    var listPlayers: List<GameRoomPlayersModel> = mutableListOf()

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_user_owner", referencedColumnName = "id", insertable = false, updatable = false)
    var userOwner:UserModel? = null

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_game", referencedColumnName = "id", insertable = false, updatable = false)
    val game:GameModel? = null
}