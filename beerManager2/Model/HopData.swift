//
//  HopData.swift
//  beerManager2
//
//  Created by Michał Massloch on 08/03/2023.
//

import Foundation

// MARK: - HopData
struct HopData: Codable {
    let alphaMax: Double
    let alphaMin: Double
    let aroma: String
    let betaMax: Double
    let betaMin: Double
    let brewingUsage: String
    let cohumuloneMax, cohumuloneMin: Int
    let country: String
    let id: Int
    let info, name, pedigree, styles: String
    let totalOilMax, totalOilMin: Double
    let trade: String

    enum CodingKeys: String, CodingKey {
        case alphaMax = "alpha_max"
        case alphaMin = "alpha_min"
        case aroma
        case betaMax = "beta_max"
        case betaMin = "beta_min"
        case brewingUsage = "brewing_usage"
        case cohumuloneMax = "cohumulone_max"
        case cohumuloneMin = "cohumulone_min"
        case country, id, info, name, pedigree, styles
        case totalOilMax = "total_oil_max"
        case totalOilMin = "total_oil_min"
        case trade
    }
}
