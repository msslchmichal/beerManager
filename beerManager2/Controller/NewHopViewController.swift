//
//  NewHopViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/03/2022.
// TODO: gray add button until all textfields are filled with data

import UIKit

protocol NewHopViewControllerDelegate: AnyObject {
    func didFinishAddNewHop(_ controller: NewHopViewController, didFinish newhop: NewHop, didFinish newResult: Double)
}

class NewHopViewController: UIViewController {
    
    var arrayOfHops: [NewHop] = []
    var arrayOfResults: [Double] = []
    
    @IBOutlet weak var hopNameTextField: UITextField!
    @IBOutlet weak var hopWeightTextField: UITextField!
    @IBOutlet weak var hopAlphaAcidTextField: UITextField!
    @IBOutlet weak var hopBoilTimeTextField: UITextField!
    @IBOutlet weak var hopGravityOfBatchTexfield: UITextField!
    @IBOutlet weak var hopVolumeOfBatchTextField: UITextField!
    @IBOutlet weak var bottomAddButton: UIButton!
    
    var newHop: NewHop?
    weak var delegate: NewHopViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomAddButton.backgroundColor = UIColor.systemGray
    }
    func add() {
        let newhop = NewHop(name: hopNameTextField.text, weight: hopWeightTextField.text, alphaAcid: hopAlphaAcidTextField.text, time: hopBoilTimeTextField.text, gravity: hopGravityOfBatchTexfield.text, volume: hopVolumeOfBatchTextField.text)
        let ibuDouble = Double(newhop.result)
        arrayOfHops.append(newhop)
        if let safeIBUDouble = ibuDouble {
            arrayOfResults.append(safeIBUDouble)
            delegate?.didFinishAddNewHop(self, didFinish: newhop, didFinish: safeIBUDouble)
        }
        else {
            wrongData(/*error: <#T##String#>*/)
        }
        print("newhop.result = \(newhop.result)")
    }
    func wrongData(/**/) {
        bottomAddButton.backgroundColor = UIColor.systemRed
        bottomAddButton.setTitle("Wrong data:", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.bottomAddButton.backgroundColor = UIColor.systemGray
            self.bottomAddButton.setTitle("Add", for: .normal)
        }
    }

    @IBAction func bottomAddButtonPressed(_ sender: UIButton) {
        add()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
