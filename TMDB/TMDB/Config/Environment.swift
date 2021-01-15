//
//  Environment.swift
//  TMDB
//
//  Created by Jose Ponciano López Romero on 1/14/21.
//  Copyright © 2021 JoseLR. All rights reserved.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let rootURL = "ROOT_URL"
            static let mockedEnv = "ENV_MOCK"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
    
    static let isEnvMocked: Bool = {
        guard let mockedEnvStr = Environment.infoDictionary[Keys.Plist.mockedEnv] as? String else {
            fatalError("ENV MOCK not set in plist for this environment")
        }
        guard let mockedEnv = Bool(mockedEnvStr) else {
            fatalError("ENV MOCK is invalid")
        }
        return mockedEnv
    }()
}
