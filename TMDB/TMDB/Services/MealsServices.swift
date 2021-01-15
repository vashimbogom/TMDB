//
//  MealsServices.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

struct GetAllMeals: RequestType {
    typealias ResponseType = Meals
    var data: RequestData {
        return RequestData(path: "\(Environment.rootURL)\(ServiceEndpoints.allMeals)")
    }
}

struct RandomMeals: RequestType {
    typealias ResponseType = Meals
    var data: RequestData {
        return RequestData(path: "\(Environment.rootURL)\(ServiceEndpoints.randomMeal)")
    }
}

struct MealsByName: RequestType {
    typealias ResponseType = Meals
    let searchName: String
    var data: RequestData {
        return RequestData(path: "\(Environment.rootURL)\(ServiceEndpoints.mealsByName)\(searchName)")
    }
}
