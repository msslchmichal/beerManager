//
//  BeerAlcohol.swift
//  beerManager2
//
//  Created by Michał Massloch on 13/02/2022.
//

import Foundation

struct BeerAlcohol {
    
    enum UserDataError: String {
        case inputIsNotAboveZero = "Input is not above 0"
        case emptyTextField = "Empty texfield"
        case unknownError = "Unknown error"
    }
    
    func alcCountingFunc(og: String?, fg: String?) -> String {
        
        guard let unwrappedOg = og, let unwrapperFg = fg else {
            return UserDataError.emptyTextField.rawValue
        }
        guard let unwrappedOgDouble = Double(unwrappedOg), let unwrappedFgDouble = Double(unwrapperFg) else {
            return UserDataError.unknownError.rawValue
        }
       
        let result = String(format: "%.2f", ((unwrappedOgDouble-unwrappedFgDouble)/1.938))
        return result
    }
    
}


