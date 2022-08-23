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
        case sameOGandFG = "OG and FG can't be equal"
    }
    
    func alcCountingFunc(og: String?, fg: String?) -> String {
        
        guard let unwrappedOg = og, let unwrappedFg = fg else {
            return UserDataError.emptyTextField.rawValue
        }
        guard let unwrappedOgDouble = Double(unwrappedOg), let unwrappedFgDouble = Double(unwrappedFg) else {
            return UserDataError.unknownError.rawValue
        }
        if unwrappedOgDouble == 0.0 || unwrappedFgDouble == 0.0 {
            return UserDataError.inputIsNotAboveZero.rawValue
        }
        else if unwrappedOgDouble == unwrappedFgDouble {
            return UserDataError.sameOGandFG.rawValue
        }
        else {
            let result = String(format: "%.2f", ((unwrappedOgDouble-unwrappedFgDouble)/1.938))
            return result
        }
    }
}
