//
//  NewHopViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/03/2022.
//

import UIKit

protocol NewHopViewControllerDelegate: AnyObject {
    func didFinishAddNewHop(_ controller: NewHopViewController, didFinish newhop: NewHop, didFinish newResult: Double)
}

class NewHopViewController: UITableViewController {
    
    var arrayOfHops: [NewHop] = []
    var arrayOfResults: [Double] = []
    
    @IBOutlet weak var hopNameTextField: UITextField!
    @IBOutlet weak var hopWeightTextField: UITextField!
    @IBOutlet weak var hopAlphaAcidTextField: UITextField!
    @IBOutlet weak var hopBoilTimeTextField: UITextField!
    @IBOutlet weak var hopGravityOfBatchTexfield: UITextField!
    @IBOutlet weak var hopVolumeOfBatchTextField: UITextField!
    
    var newHop: NewHop?
    weak var delegate: NewHopViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        let newhop = NewHop(name: hopNameTextField.text!, weight: hopWeightTextField.text!, alphaAcid: hopAlphaAcidTextField.text!, time: hopBoilTimeTextField.text!, gravity: hopGravityOfBatchTexfield.text!, volume: hopVolumeOfBatchTextField.text!)
        let ibu = IBUCounting().result(weight: hopWeightTextField.text!, gravity: hopGravityOfBatchTexfield.text!, aa: hopAlphaAcidTextField.text!, time: hopBoilTimeTextField.text!, volume: hopVolumeOfBatchTextField.text!)
        let ibuDouble = Double(ibu)
        arrayOfHops.append(newhop)
        arrayOfResults.append(ibuDouble!)
        delegate?.didFinishAddNewHop(self, didFinish: newhop, didFinish: ibuDouble!)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
