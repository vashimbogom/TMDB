//
//  MockNetworkDispatcher.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

private enum MockedResponseFiles {
    static let allMeals = "Mock_AllMeals"
    static let mealDetail = "Mock_MealDetail"
}

public struct MockNetworkDispatcher: NetworkDispatcher {
    public static let instance = MockNetworkDispatcher()
    private init() {}
    
    public func dispatch(request: RequestData, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        
        let jsonFile = getJsonMockFileName(endpoint: request.path)
        
        let bundle = Bundle.main
        if let path = bundle.path(forResource: jsonFile, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                onSuccess(data)
            } catch {
                fatalError("a Mock file should be configured for the Endpoint: \(request.path)")
            }
        }
        
    }
    
    private func getJsonMockFileName(endpoint: String) -> String {
        switch endpoint {
        case "\(Environment.rootURL)\(ServiceEndpoints.allMeals)":
            return MockedResponseFiles.allMeals
        case "\(Environment.rootURL)\(ServiceEndpoints.randomMeal)":
            return MockedResponseFiles.mealDetail
        default:
            if endpoint.contains(ServiceEndpoints.mealsByName) {
                return MockedResponseFiles.mealDetail
            } else {
                fatalError("a Mock file should be configured for the Endpoint: \(endpoint)")
            }
        }
        
    }
}
