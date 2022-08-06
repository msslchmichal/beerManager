//
//  BeerStyle.swift
//  beerManager2
//
//  Created by Michał Massloch on 30/01/2022.
//

import Foundation

//struct for Beer style used in BeersTableVC n BeerDetailVC

struct Style: Codable {
    let id: Int
    let name: String // name of beer style
    
    let og_plato: String // Original Gravity in Plato
    let og_min_plato: Double // Minimum OG in Plato
    let og_max_plato: Double // Maximum OG in Plato
    
    let fg_plato: String // Final Gravity in Plato
    let fg_min_plato: Double // Minimum FG in Plato
    let fg_max_plato: Double // Maxiumum FG in plato
    
    let abv: String // Alcohol by volume
    
    let ibu: String // internation bitterness unit
    
    let prefered_glass: String
}
