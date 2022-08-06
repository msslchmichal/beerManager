//
//  BeerDetailViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/01/2022.
//
// TODO: image of preferred glass, color in ebc

import UIKit

class BeerDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel! // name of beer style
    @IBOutlet weak var ogLabel: UILabel! // Original Gravity
    @IBOutlet weak var fgLabel: UILabel! // Final Gravity
    @IBOutlet weak var abvLabel: UILabel! // Alcohol by volume
    @IBOutlet weak var ibuLabel: UILabel! // IBU
    @IBOutlet weak var glassLabel: UILabel! // Preferred glass
    
    
    var selectedBeer: String?
    var name: String!
    var ogMin: String! // minimum Original Gravity
    var ogMax: String! // maximum Original Gravity
    var og: String! // min-max OG
    var fg: String! // min-max FG
    var ab: String! // min-max ABV
    var ibu: String! // min-max IBU
    var glass: String! // preferred glass

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NAVBARTITITLE"
        
        nameLabel.text = name
        ogLabel.text = "Ekstrakt początkowy: \(og ?? "default") Blg"
        fgLabel.text = "Ekstrakt końcowy: \(fg ?? "default") Blg"
        abvLabel.text = "Zawartość alkoholu: \(ab ?? "default")"
        ibuLabel.text = "Goryczka: \(ibu ?? "default")"
        glassLabel.text = "Polecane szkło: \(glass ?? "default")"
        
    }
}
