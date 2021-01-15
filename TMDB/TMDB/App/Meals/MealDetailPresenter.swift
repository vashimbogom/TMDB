//
//  MealDetailPresenter.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

protocol MealDetail {
    var mealDetailView: MealDetailView? { get }
    
    func attachView(_ view: MealDetailView)
    func detachView()
    func setMealDetail(_ meal: Meal)
}

class MealDetailPresenter: MealDetail {
    
    var mealDetailView: MealDetailView?
    
    func attachView(_ view: MealDetailView) {
        mealDetailView = view
    }
    
    func detachView() {
        mealDetailView = nil
    }
    
    func setMealDetail(_ meal: Meal) {
        mealDetailView?.showMeal(meal)
    }
}
