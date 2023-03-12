//
//  BeerDetailViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/01/2022.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    @IBOutlet weak var ogLabel: UILabel! // Original Gravity
    @IBOutlet weak var fgLabel: UILabel! // Final Gravity
    @IBOutlet weak var abvLabel: UILabel! // Alcohol by volume
    @IBOutlet weak var ibuLabel: UILabel! // IBU
    @IBOutlet weak var glassLabel: UILabel! // Preferred glass
    @IBOutlet weak var colourLabel: UILabel! // color in ebc
    @IBOutlet weak var notesTextView: UITextView! //notes
    @IBOutlet weak var glassImageView: UIImageView! //glass image based on glass type and color in ebc
    @IBOutlet weak var simpleDetailView: UIView!
    @IBOutlet weak var glassView: UIView!
    @IBOutlet weak var textView: UIView!
    
    var selectedBeer: String?
    var name: String!
    var og: String! // min-max OG
    var fg: String! // min-max FG
    var ab: String! // min-max ABV
    var ibu: String! // min-max IBU
    var glass: String! // preferred glass
    var colour: String! // colour in ebc
    var malt: String! 
    var hop: String!
    var fermentation: String!
    var notes: String! //
    var colorImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = name
        setupUI()
        populateUIWithData()
    }
    
    func setupUI() {
        let views: [UIView] = [simpleDetailView,glassView,textView]
        for view in views {
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 6)
            view.layer.shadowRadius = 7
            view.layer.shadowOpacity = 0.3
            view.layer.cornerRadius = 10
        }
    }
    func populateUIWithData() {
        ogLabel.text = "OG: \(og ?? "default") Blg"
        fgLabel.text = "FG: \(fg ?? "default") Blg"
        abvLabel.text = "ABV: \(ab ?? "default")"
        ibuLabel.text = "IBU: \(ibu ?? "default")"
        glassLabel.text = "Glass: \(glass ?? "default")"
        colourLabel.text = "Colour: \(colour ?? "default") °EBC"
        notesTextView.text = "\(notes ?? "") \n \n Perceived malt: \(malt ?? "") \n \n Perceived hop: \(hop ?? "") \n \n Fermentation: \(fermentation ?? "")"
        glassImageView.image = UIImage(named: "\(glass ?? "shaker")\(colorImage ?? "10")")
    }
}
