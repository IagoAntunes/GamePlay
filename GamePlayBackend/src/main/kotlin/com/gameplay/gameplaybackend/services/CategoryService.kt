package com.gameplay.gameplaybackend.services

import com.gameplay.gameplaybackend.dtos.CategoryDto
import com.gameplay.gameplaybackend.repositories.ICategoryRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

@Service
class CategoryService {

    @Autowired
    private  lateinit var _categoryRepository: ICategoryRepository

    fun getAllCategories() : List<CategoryDto>{
        val result = _categoryRepository.findAll()

        val list = mutableListOf<CategoryDto>()
        for (category in result){
            list.add(CategoryDto(category.id,category.name,category.imageUrl))
        }

        return list
    }


}
