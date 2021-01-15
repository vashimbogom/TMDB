//
//  UIViewControllerWithLoader.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import UIKit

class UIViewControllerWithLoader: UIViewController, ViewServiceLoader {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    func startLoader() {
        activityIndicator?.startAnimating()
    }
    
    func endLoader() {
        activityIndicator?.stopAnimating()
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
