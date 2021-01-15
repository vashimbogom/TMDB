//
//  MealsListViewController.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import UIKit

protocol MealsListView {
    func showLoader()
    func hideLoader()
    func setMeals(_ meals: [Meal])
    func setRandomMeal(_ meal: Meal)
    func showMealDetail(meal: Meal)
}

class MealsListViewController: UIViewControllerWithLoader, MealsListView {
    
    private let mealsListPresenter = MealsListPresenter()
    private var mealsToDisplay = [Meal]()
    private var randomMealToDisplay: Meal?
    
    @IBOutlet weak var mealsCollectionView: UICollectionView!
    @IBOutlet weak var randomMealImage: ImageLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealsCollectionView.dataSource = self
        mealsCollectionView.delegate = self
        hideKeyboardWhenTappedAround()
        mealsListPresenter.attachView(self)
        getRandoomMeal()
        Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { [weak self] timer in
            self?.getRandoomMeal()
        }
        mealsListPresenter.getAllMeals()
    }
    
    func setMeals(_ meals: [Meal]) {
        mealsToDisplay = meals
        mealsCollectionView?.reloadData()
    }
    
    func showLoader() {
        super.startLoader()
    }
    
    func hideLoader() {
        super.endLoader()
    }
    
    func getRandoomMeal() {
        mealsListPresenter.getRandomMeal()
    }
    
    func setRandomMeal(_ meal: Meal) {
        randomMealToDisplay = meal
        let strUrl = meal.strMealThumb
        if let imgUrl = URL(string: strUrl) {
            randomMealImage?.loadImageWithUrl(imgUrl)
        }
    }
    
    func showMealDetail(meal: Meal) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = mainStoryboard.instantiateViewController(withIdentifier: "MealDetailViewController") as? MealDetailViewController {
            detailVC.setMeal(meal)
            present(detailVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func showRandomMeal(_ sender: Any) {
        if let randomMeal = randomMealToDisplay {
            mealsListPresenter.showMealDetail(meal: randomMeal)
        }
    }
}

extension MealsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mealsToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCell", for: indexPath) as? MealViewCell {
            cell.meal = mealsToDisplay[indexPath.row]
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
}

extension MealsListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let itemCellWidth: CGFloat = 150
        let totalCells = floor(collectionView.frame.size.width / itemCellWidth)
        let itemEdgeInsets = (collectionView.frame.size.width - totalCells * itemCellWidth) / (totalCells + 1)
        return UIEdgeInsets(top: 13, left: itemEdgeInsets, bottom: 0, right: itemEdgeInsets)
    }
}

extension MealsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMeal = mealsToDisplay[indexPath.row]
        mealsListPresenter.showMealDetail(meal: selectedMeal)
    }

}

extension MealsListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            mealsListPresenter.searchMealsByName(text)
        }
    }
}
