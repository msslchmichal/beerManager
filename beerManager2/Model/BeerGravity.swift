//
//  BeerGravity.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/06/2022.
//

import Foundation

struct BeerGravity {
    
//    let gravity: String?
//    let temperature: String?
    
    enum UserDataError: String {
        case inputIsNotAboveZero = "Input is not above 0"
        case emptyTextField = "Empty texfield"
        case unknownError = "Unknown error"
    }
    
    func gravityCounting(gravity: String?, temperature: String?) -> String {

        guard let unwrappedGravity = gravity, let unwrappedTemperature = temperature else {
            return UserDataError.emptyTextField.rawValue
        }
        guard let unwrappedGravityDouble = Double(unwrappedGravity), let unwrappedTemperatureDouble = Double(unwrappedTemperature)  else {
            return UserDataError.unknownError.rawValue
        }
        
        if unwrappedGravityDouble > 0.0 && unwrappedTemperatureDouble > 0.0 {
            let x = 0.075
            let result = String( ((unwrappedTemperatureDouble-20)*x)+unwrappedGravityDouble)
            return result
        }
        else if unwrappedGravityDouble <= 0.0 || unwrappedTemperatureDouble <= 0.0 {
            return UserDataError.inputIsNotAboveZero.rawValue
        }
        else {
            return UserDataError.unknownError.rawValue
        }
    }
}
