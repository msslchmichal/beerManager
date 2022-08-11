//
//  NewHop.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/06/2022.
//

import Foundation

struct NewHop {
    
    let name: String
    let weight: String
    let alphaAcid: String
    let time: String
    let gravity: String
    let volume: String
    
}

struct IBUCounting {
    func result(weight: String, gravity: String, aa: String, time: String, volume: String) -> String{

        let gravityInDouble = Double(gravity)!
        let timeInDouble = Double(time)!
        let volumeInDouble = Double(volume)!
        let platoToSG = 1+(gravityInDouble/(258.6-((gravityInDouble/258.2)*227.1)))
        print("platoToSG: \(platoToSG)")
        let fg = 1.65 * pow(0.000125, platoToSG-1)
        print("fg \(fg)")
        let ft = (1-pow(2.718281828459, (-0.04*timeInDouble)))/4.15
        print("ft \(ft)")
        let ekstraktywnosc = fg*ft
        print(ekstraktywnosc)
        let ibu = Double(weight)! * Double(aa)! * ekstraktywnosc * Double(10/volumeInDouble)
        print("ibu = \(Double(weight)!) * \(Double(aa)!) * \(ekstraktywnosc) * \(Double(10/volumeInDouble))")
        print("ibu: \(ibu)")
        let roundedIBU = String(format: "%.2f", ibu)
        print("roundedIBU: \(roundedIBU)")
        return roundedIBU
    }
}

