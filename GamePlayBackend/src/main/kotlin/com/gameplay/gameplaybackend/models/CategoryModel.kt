package com.gameplay.gameplaybackend.models

import jakarta.persistence.*

@Entity
@Table(name = "categories")
class CategoryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0
    @Column(name = "name", nullable = false)
    val name:String = ""

}