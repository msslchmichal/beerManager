//
//  BeerCarbonation.swift
//  beerManager2
//
//  Created by Michał Massloch on 11/02/2022.
//

import Foundation

struct BeerCarbonation {
    
    let styles = [
        BeerStyleSimple(styleName: "Brytyjskie ale", minCarbonation: 1.5, maxCarbonation: 2.0),
        BeerStyleSimple(styleName: "Porter, Stout", minCarbonation: 1.7, maxCarbonation: 2.3),
        BeerStyleSimple(styleName: "Belgijskie ale", minCarbonation: 1.9, maxCarbonation: 2.4),
        BeerStyleSimple(styleName: "Amerykańskie ale, Lagery", minCarbonation: 2.2, maxCarbonation: 2.7),
        BeerStyleSimple(styleName: "Belgijskie lambiki", minCarbonation: 2.4, maxCarbonation: 2.8),
        BeerStyleSimple(styleName: "Amerykańskie pszniczne", minCarbonation: 2.7, maxCarbonation: 3.3),
        BeerStyleSimple(styleName: "Niemieckie pszczeniczne", minCarbonation: 3.3, maxCarbonation: 4.5)
    ]
    //residualCo2 is array of residual co2 amount at given temperature, residualCo2[0] is 5 celsius, next one is 6 etc.
    let residualCo2 = [1.32, 1.27, 1.23, 1.19, 1.16, 1.12, 1.08, 1.05, 1.02, 0.99, 0.96, 0.93, 0.90, 0.87, 0.84, 0.82, 0.80, 0.77, 0.75, 0.73, 0.72, 0.70, 0.68, 0.67, 0.65, 0.64]
  


    func carbonationCalculation (primerType: Int, maxForChosenStyle: Double, minForChosenStyle: Double, amount: String?, temperature: String?) -> String {
        guard let unwrappedAmount = amount, let unwrappedTemperature = temperature else {
            return "wrong typed data"
        }
        guard let unwrappedAmountDouble = Double(unwrappedAmount), let unwrappedTemperatureDouble = Double(unwrappedTemperature)  else {
            return "wrong doubling"
        }
        
        let temperatureInt = Int(round(unwrappedTemperatureDouble))
        let leftco2value = residualCo2[temperatureInt-5]
        
        var fermentability = 0.0
        var percentageOfSolidState = 0.0
        var amountForOneLiterOfCo2 = 0.0
        
        if primerType == 0 {
            percentageOfSolidState = 1.0
            fermentability = 1.0
            amountForOneLiterOfCo2 = 3.49
            
        }
        else if primerType == 1 {
            percentageOfSolidState = 0.91
            fermentability = 1.0
            amountForOneLiterOfCo2 = 4.04
        }
        let sugarMin = String(format:"%.1f",(minForChosenStyle-leftco2value)*unwrappedAmountDouble*(1/percentageOfSolidState)*(1/fermentability)*amountForOneLiterOfCo2)
        let sugarMax = String(format:"%.1f",(maxForChosenStyle-leftco2value)*unwrappedAmountDouble*(1/percentageOfSolidState)*(1/fermentability)*amountForOneLiterOfCo2)
        let result = "\(sugarMin) - \(sugarMax)"
        
        return result
    }
}




