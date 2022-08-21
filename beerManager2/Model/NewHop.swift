//
//  NewHop.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/06/2022.
//

import Foundation

struct NewHop {
    
    let name: String?
    let weight: String?
    let alphaAcid: String?
    let time: String?
    let gravity: String?
    let volume: String?
    var result: String {

        guard let unwWeight = weight, let unwGravity = gravity, let unwAa = alphaAcid, let unwTime = time, let unwVolume = volume else {
            return "empty textfield"
        }

        guard let weightDouble = Double(unwWeight), let gravityDouble = Double(unwGravity), let aaDouble = Double(unwAa), let timeDouble = Double(unwTime), let volumeDouble = Double(unwVolume) else {
            return "unknown error"
        }
        
        let platoToSG = 1+(gravityDouble/(258.6-((gravityDouble/258.2)*227.1)))
        print("platoToSG: \(platoToSG)")
        let fg = 1.65 * pow(0.000125, platoToSG-1)
        print("fg \(fg)")
        let ft = (1-pow(2.718281828459, (-0.04*timeDouble)))/4.15
        print("ft \(ft)")
        let ekstraktywnosc = fg*ft
        print(ekstraktywnosc)
        let ibu = weightDouble * aaDouble * ekstraktywnosc * Double(10/volumeDouble)
        print("ibu = \(weightDouble) * \(aaDouble) * \(ekstraktywnosc) * \(Double(10/volumeDouble))")
        print("ibu: \(ibu)")
        let roundedIBU = String(format: "%.2f", ibu)
        print("roundedIBU: \(roundedIBU)")
        return roundedIBU
    }
    
}

