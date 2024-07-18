package com.gameplay.gameplaybackend.controllers

import com.gameplay.gameplaybackend.dtos.CategoryDto
import com.gameplay.gameplaybackend.dtos.GameDto
import com.gameplay.gameplaybackend.models.BaseListResponse
import com.gameplay.gameplaybackend.services.CategoryService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/categories")
class CategoryController {

    @Autowired
    private lateinit var categoryService: CategoryService


    @GetMapping
    fun getAllCategories() : ResponseEntity<BaseListResponse<CategoryDto>>{
        val result = categoryService.getAllCategories()

        val response = BaseListResponse(result,"Jogos consultados com sucesso",true)

        return ResponseEntity.ok().body(response);
    }



}