//
//  GravityViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
// TODO: navigation bar background image, results to CoreData

import UIKit

class GravityViewController: UIViewController {
    
    let gravityCounting = BeerGravity()
    
    @IBOutlet weak var gravityTextField: UITextField!
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMetricSystem()

        countButton.backgroundColor = .systemGray
        countButton.isEnabled = false
        
        resultLabel.text = " "
        
        [gravityTextField, temperatureTextField].forEach { field in
            field?.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        }
    }
        
    @objc private func editingChanged(_ textField: UITextField) {
        guard let gravityTextField = gravityTextField, let temperatureTextField = temperatureTextField
        else { return }
        let textFields = [gravityTextField, temperatureTextField]
        textFields.enableButton(countButton)
    }
    
    @IBAction func countButtonPressed(_ sender: UIButton) {
        let gravity = gravityTextField.text!
        let temperature = temperatureTextField.text!
        
        switch gravityCounting.calculateCorrectGravity(gravity: gravity, temperature: temperature) {
        case .success(let result):
            resultLabel.text = "\(String(format: "%.2f", result)) Blg"
        case .failure(let error):
            wrongData(error: error.rawValue, countButton: countButton)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
