//
//  EnvironmentVariables.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/12/22.
//

import Foundation

struct EnvVariables: Decodable {
    let baseUrl: String
       
    private init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case baseUrl = "BaseUrl"
    }
    
    static let instance: EnvVariables = load()
    
    private static func load() -> EnvVariables {
        if let plistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
            do {
                let plistData = try Data(contentsOf: plistPath)
                return try PropertyListDecoder().decode(EnvVariables.self, from: plistData)
            } catch {}
        }
        
        return EnvVariables(
            baseUrl: ""
        )
    }
}
