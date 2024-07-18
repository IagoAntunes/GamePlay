package com.gameplay.gameplaybackend.repositories

import com.gameplay.gameplaybackend.models.CategoryModel
import org.springframework.data.jpa.repository.JpaRepository


interface  ICategoryRepository : JpaRepository<CategoryModel,Long>{

}
