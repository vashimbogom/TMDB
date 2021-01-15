//
//  MealDetailViewController.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import UIKit
import WebKit

protocol MealDetailView {
    func setMeal(_ meal: Meal)
    func showMeal(_ meal: Meal)
}

class MealDetailViewController: UIViewControllerWithLoader, MealDetailView {
    
    private let mealDetailPresenter = MealDetailPresenter()
    private var mealToDisplay: Meal?
    
    @IBOutlet weak var mealImage: ImageLoader!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealCategory: UILabel!
    @IBOutlet weak var mealInstructions: UITextView!
    @IBOutlet weak var mealIngredients: UITextView!
    @IBOutlet weak var ytWebview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealDetailPresenter.attachView(self)
        guard let meal = mealToDisplay else { return }
        mealDetailPresenter.setMealDetail(meal)
        addYoutubeVideo(url: meal.strYoutube ?? "")
    }
    
    func setMeal(_ meal: Meal) {
        mealToDisplay = meal
    }
    
    func showMeal(_ meal: Meal) {
        mealName.text = mealToDisplay?.strMeal
        mealCategory.text = mealToDisplay?.strCategory
        mealInstructions.text = mealToDisplay?.strInstructions
        mealIngredients.text = mealToDisplay?.ingredients
        if let strUrl = mealToDisplay?.strMealThumb,
            let imgUrl = URL(string: strUrl) {
            mealImage?.loadImageWithUrl(imgUrl)
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension MealDetailViewController:  WKNavigationDelegate {

    func addYoutubeVideo(url: String) {
        if let url = URL(string: url) {
            ytWebview.load(URLRequest(url: url))
            ytWebview.allowsBackForwardNavigationGestures = false
        }
    }
}
