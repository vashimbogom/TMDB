//
//  File.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

protocol Loader {
    func showLoader()
    func hideLoader()
}

protocol  ViewServiceLoader {
    func startLoader()
    func endLoader()
}
