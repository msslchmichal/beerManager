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
        print("in NewHopViewController viewDidLoad")
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        
//        if let hopName = hopNameTextField.text, let hopWeight = hopWeightTextField.text, let hopAlphaAcid = hopAlphaAcidTextField.text, let hopBoilTime = hopBoilTimeTextField.text, let hopGravityOfBatch = hopGravityOfBatchTexfield.text, let hopVolumeOfBatch = hopVolumeOfBatchTextField.text {
//            print("it is hop named \(hopName), \(hopWeight), \(hopAlphaAcid), \(hopBoilTime), \(hopGravityOfBatch), \(hopVolumeOfBatch)")
//
//        }
        let newhop = NewHop(name: hopNameTextField.text!, weight: hopWeightTextField.text!, alphaAcid: hopAlphaAcidTextField.text!, time: hopBoilTimeTextField.text!, gravity: hopGravityOfBatchTexfield.text!, volume: hopVolumeOfBatchTextField.text!)
        let ibu = IBUCounting().result(weight: hopWeightTextField.text!, gravity: hopGravityOfBatchTexfield.text!, aa: hopAlphaAcidTextField.text!, time: hopBoilTimeTextField.text!, volume: hopVolumeOfBatchTextField.text!)
        let ibuDouble = Double(ibu)
        arrayOfHops.append(newhop)
        arrayOfResults.append(ibuDouble!)
        
        print(newhop)
        delegate?.didFinishAddNewHop(self, didFinish: newhop, didFinish: ibuDouble!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
