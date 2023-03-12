//
//  BeerGravity.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/06/2022.
//

import Foundation

struct BeerGravity {
    
    enum UserDataError: String, Error {
        case inputIsNotAboveZero = "Input is not above 0"
        case emptyTextField = "Empty texfield"
        case unknownError = "Unknown error"
    }
    
    func calculateCorrectGravity(gravity: String?, temperature: String?) -> Result<Double, UserDataError> {

        guard let gravity = gravity, let temperature = temperature
            else { return .failure(.emptyTextField) }
        
        guard let gravityDouble = Double(gravity), let temperatureDouble = Double(temperature)
            else { return .failure(.unknownError) }
        
        switch (gravityDouble,temperatureDouble) {
        case (-0.1,_),(_,0.0):
            return .failure(.inputIsNotAboveZero)
        case let (gravity, temperature):
            let x = 0.075
            let result = ((temperature-20)*x)+gravity
            return .success(result)
        }
    }
}
