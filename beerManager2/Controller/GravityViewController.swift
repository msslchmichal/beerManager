//
//  GravityViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
import UIKit

class GravityViewController: UIViewController {
    
    @IBOutlet weak var gravityTextField: UITextField!
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        resultLabel.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func countButtonPressed(_ sender: UIButton) {
        
        let gravityDouble: String? = gravityTextField.text!
        let temperatureDouble: String? = temperatureTextField.text!
        let result = BeerGravity().gravityCounting(gravity: gravityDouble, temperature: temperatureDouble)
        if result == BeerGravity.UserDataError.emptyTextField.rawValue || result == BeerGravity.UserDataError.inputIsNotAboveZero.rawValue  || result == BeerGravity.UserDataError.unknownError.rawValue {
            wrongData(error: result)
        }
        else {
            resultLabel.text = "Correct gravity: \(result)"
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
}
