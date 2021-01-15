//
//  Meal.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

struct Meals: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    
    let idMeal: String
    let strMeal: String
    let strArea: String?
    let strCategory: String?
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    var ingredients: String {
        get{
            //i know this could be a lot better
            //like calling the properties dinamically by name...
            //but had not much time....
            var ing = ""
            if let sti = strIngredient1 {
                ing = "- \(sti)\n"
            }
            if let sti = strIngredient2 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient3 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient4 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient5 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient6 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient7 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient8 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient9 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient10 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient11 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient12 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient13 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient14 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient15 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient16 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient17 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient18 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient19 {
                ing = "\(ing)- \(sti)\n"
            }
            if let sti = strIngredient20 {
                ing = "\(ing)- \(sti)\n"
            }
            
            return ing
        }
    }
}
