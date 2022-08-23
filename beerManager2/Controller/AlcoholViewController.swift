//
//  AlcoholViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//

import UIKit

class AlcoholViewController: UIViewController {
    
    let alcCounting = BeerAlcohol()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var ogTextField: UITextField! // Original Gravity
    @IBOutlet weak var fgTextField: UITextField! // Final Gravity
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
        countButton.backgroundColor = UIColor.systemGray
        countButton.isEnabled = false
        
        [ogTextField, fgTextField].forEach { (field) in
            field?.addTarget(self,
                             action: #selector(editingChanged(_:)),
                             for: .editingChanged)
        }
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        
        guard
            let og = ogTextField.text, !og.isEmpty,
            let fg = fgTextField.text, !fg.isEmpty
        else {
            countButton.isEnabled = false
            countButton.backgroundColor = UIColor.systemGray
            return
        }
        countButton.isEnabled = true
        countButton.backgroundColor = UIColor.systemGreen
    }
    
    @IBAction func countButtonPressed(_ sender: UIButton) {
        let og = ogTextField.text!
        let fg = fgTextField.text!
        let result = alcCounting.alcCountingFunc(og: og, fg: fg)
        let error = BeerAlcohol.UserDataError.self
        if  result == error.emptyTextField.rawValue ||
            result == error.inputIsNotAboveZero.rawValue ||
            result == error.unknownError.rawValue ||
            result == error.sameOGandFG.rawValue {
            wrongData(error: result)
        }
        else {
            resultLabel.text = (result + "%")
        }
    }
    
    func wrongData(error: String) {
        countButton.backgroundColor = UIColor.systemRed
        countButton.setTitle("Wrong data: \(error)", for: .normal)
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
