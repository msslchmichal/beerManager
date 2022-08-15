//
//  BeerDetailViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/01/2022.
//
// TODO: image of preferred glass, color in ebc

import UIKit

class BeerDetailViewController: UIViewController {
    
    @IBOutlet weak var ogLabel: UILabel! // Original Gravity
    @IBOutlet weak var fgLabel: UILabel! // Final Gravity
    @IBOutlet weak var abvLabel: UILabel! // Alcohol by volume
    @IBOutlet weak var ibuLabel: UILabel! // IBU
    @IBOutlet weak var glassLabel: UILabel! // Preferred glass
    @IBOutlet weak var colourLabel: UILabel! // colour in ebc
    @IBOutlet weak var notesTextView: UITextView!
    
    var selectedBeer: String?
    var name: String!
    var ogMin: String! // minimum Original Gravity
    var ogMax: String! // maximum Original Gravity
    var og: String! // min-max OG
    var fg: String! // min-max FG
    var ab: String! // min-max ABV
    var ibu: String! // min-max IBU
    var glass: String! // preferred glass
    var colour: String! // colour in ebc
    var notes: String! //

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = name
        ogLabel.text = "OG: \(og ?? "default") Blg"
        fgLabel.text = "FG: \(fg ?? "default") Blg"
        abvLabel.text = "ABV: \(ab ?? "default")"
        ibuLabel.text = "IBU: \(ibu ?? "default")"
        glassLabel.text = "Glass: \(glass ?? "default")"
        colourLabel.text = "Colour: \(colour ?? "default") °EBC"
        notesTextView.text = notes ?? "default"
    }
}
