//
//  ApiMockLoader.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/12/22.
//

import Foundation


class ApiMockLoader {
    
    class func loadProductsByCategory() -> Data? {
        return loadMockFile(fileName: "productsByCategory")
    }
    
    
    private class func loadMockFile(fileName: String) -> Data? {
        if let mockPath = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                return try Data(contentsOf: mockPath)
            } catch {
                print(error)
            }
        }
        return nil
    }
}
