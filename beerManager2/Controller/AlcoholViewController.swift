//
//  AlcoholViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
// TODO: gray add button until all textfields are filled with data

import UIKit

class AlcoholViewController: UIViewController {
    
    let alcCounting = BeerAlcohol()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var og: UITextField! // Original Gravity
    @IBOutlet weak var fg: UITextField! // Final Gravity
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }
    
    @IBAction func countButtonPressed(_ sender: UIButton) {
        let og = og.text!
        let fg = fg.text!
        let result = alcCounting.alcCountingFunc(og: og, fg: fg)
        resultLabel.text = (result + "%")
    }
    
    func wrongData() {
        countButton.backgroundColor = UIColor.systemRed
        countButton.setTitle("Wrong data: error", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.countButton.backgroundColor = UIColor.systemGreen
            self.countButton.setTitle("Count", for: .normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
 
}
