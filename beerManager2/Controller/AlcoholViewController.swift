//
//  AlcoholViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
// TODO: navigation bar background image, results to CoreData

import UIKit

class AlcoholViewController: UIViewController {
    
    let alcCounting = BeerAlcohol()
    
    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var countButton: UIButton!
    @IBOutlet weak private var ogTextField: UITextField! // Original Gravity
    @IBOutlet weak private var fgTextField: UITextField! // Final Gravity
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadMetricSystem()
        resultLabel.text = ""
        countButton.backgroundColor = .systemGray
        countButton.isEnabled = false
        
        [ogTextField, fgTextField].forEach { (field) in
            field?.addTarget(self,
                             action: #selector(editingChanged(_:)),
                             for: .editingChanged)
        }
    }
        
    @objc private func editingChanged(_ textField: UITextField) {
        guard let ogTextField = ogTextField, let fgTextField = fgTextField
        else { return }
        let textFields = [ogTextField, fgTextField]
        textFields.enableButton(countButton)
    }
    
    @IBAction func countButtonPressed(_ sender: UIButton) {
        let og = ogTextField.text!
        let fg = fgTextField.text!
        
        switch alcCounting.calculateAlcoholPercentage(og: og, fg: fg) {
        case .success(let result):
            resultLabel.text = "\(String(format: "%.2f", result))%"
        case .failure(let error):
            wrongData(error: error.rawValue, countButton: countButton)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
