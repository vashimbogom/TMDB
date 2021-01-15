//
//  MealsListPresenter.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

protocol MealsList {
    var mealsListView: MealsListView? { get }
    
    func attachView(_ view: MealsListView)
    func detachView()
    
    func getAllMeals()
    func searchMealsByName(_ name: String)
    func getRandomMeal()
    func showMealDetail(meal: Meal)
}

class MealsListPresenter: MealsList {
    private let mealsService = GetAllMeals()
    private let randomMealService = RandomMeals()
    var mealsListView: MealsListView?
    
    func attachView(_ view: MealsListView) {
        mealsListView = view
    }
    
    func detachView() {
        mealsListView = nil
    }
    
    func getAllMeals() {
        self.mealsListView?.showLoader()
        
        mealsService.fetch(onSuccess: { [weak self] (meals: Meals) in
            self?.mealsListView?.setMeals(meals.meals)
            self?.mealsListView?.hideLoader()
        }) { [weak self] (error: Error) in
            error.printDescription()
            self?.mealsListView?.hideLoader()
        }
    }
    
    func searchMealsByName(_ name: String) {
        self.mealsListView?.showLoader()
        
        MealsByName(searchName: name).fetch(onSuccess: { [weak self] (meals: Meals) in
            self?.mealsListView?.setMeals(meals.meals)
            self?.mealsListView?.hideLoader()
        }) { [weak self] (error: Error) in
            error.printDescription()
            self?.mealsListView?.hideLoader()
        }
    }
    
    func getRandomMeal() {
        randomMealService.fetch(onSuccess: { [weak self] (meals: Meals) in
            if let meal = meals.meals.first {
                self?.mealsListView?.setRandomMeal(meal)
            }
        }) { (error: Error) in
            error.printDescription()
        }
    }
    
    func showMealDetail(meal: Meal) {
        self.mealsListView?.showMealDetail(meal: meal)
    }
}
