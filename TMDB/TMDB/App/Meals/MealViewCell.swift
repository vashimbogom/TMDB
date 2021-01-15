//
//  MealViewCell.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import UIKit

class MealViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealCategory: UILabel!
    @IBOutlet weak var mealImage: ImageLoader!
    
    var meal : Meal? {
        didSet {
            guard let meal = meal else {
                return
            }
            
            mealName.text = meal.strMeal
            mealCategory.text = meal.strCategory
            let strUrl = meal.strMealThumb
            if let imgUrl = URL(string: strUrl) {
                mealImage.loadImageWithUrl(imgUrl)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
