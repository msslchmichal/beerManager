//
//  BeerAlcohol.swift
//  beerManager2
//
//  Created by Michał Massloch on 13/02/2022.
//

import Foundation

struct BeerAlcohol {
    
    enum UserDataError: String, Error {
        case inputIsNotAboveZero = "Input is not above 0"
        case emptyTextField = "Empty text field"
        case unknownError = "Unknown error"
        case sameOGandFG = "OG and FG can't be equal"
        case FGcantBeMoreThanOG = "FG can't be higher than OG"
    }
    
    func calculateAlcoholPercentage(og: String?, fg: String?) -> Result<Double, UserDataError> {
        
        guard let og = og, let fg = fg
            else { return .failure(.emptyTextField) }
        guard let ogDouble = Double(og), let fgDouble = Double(fg)
            else { return .failure(.unknownError) }
        
        switch (ogDouble, fgDouble) {
        case (0.0, _), (_, 0.0):
            return .failure(.inputIsNotAboveZero)
        case (let og, let fg) where og == fg:
            return .failure(.sameOGandFG)
        case (let og, let fg) where og < fg:
            return .failure(.FGcantBeMoreThanOG)
        case let (og, fg):
            let result = (og - fg) / 1.938
            return .success(result)
        }
    }
}
