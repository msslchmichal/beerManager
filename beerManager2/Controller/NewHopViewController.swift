//
//  NewHopViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/03/2022.
// TODO: refactor bottomAddButtonPressed -> addToCoreData to .result .failure and WrongData extension

import UIKit

protocol NewHopViewControllerDelegate: AnyObject {
    func add(_ controller: NewHopViewController, didFinish hop: Hop)
}

class NewHopViewController: UIViewController {
        
    @IBOutlet weak var hopNameTextField: UITextField!
    @IBOutlet weak var hopWeightTextField: UITextField!
    @IBOutlet weak var hopAlphaAcidTextField: UITextField!
    @IBOutlet weak var hopBoilTimeTextField: UITextField!
    @IBOutlet weak var hopGravityOfBatchTexfield: UITextField!
    @IBOutlet weak var hopVolumeOfBatchTextField: UITextField!
    @IBOutlet weak var bottomAddButton: UIButton!
    
    var hop: Hop?
    weak var delegate: NewHopViewControllerDelegate?
    var coreDataManager: CoreDataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomAddButton.backgroundColor = .systemGray
        bottomAddButton.isEnabled = false
        
        [hopNameTextField, hopWeightTextField, hopAlphaAcidTextField, hopBoilTimeTextField, hopGravityOfBatchTexfield, hopVolumeOfBatchTextField].forEach { (field) in
            field?.addTarget(self,
                             action: #selector(editingChanged(_:)),
                             for: .editingChanged)
        }
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        guard let hopNameTextField = hopNameTextField,
              let hopWeightTextField = hopWeightTextField,
              let hopAlphaAcidTextField = hopAlphaAcidTextField,
              let hopBoilTimeTextField = hopBoilTimeTextField,
              let hopGravityOfBatchTexfield = hopGravityOfBatchTexfield,
              let hopVolumeOfBatchTextField = hopVolumeOfBatchTextField
        else { return }
        let textFields = [hopNameTextField, hopWeightTextField, hopAlphaAcidTextField, hopBoilTimeTextField, hopGravityOfBatchTexfield, hopVolumeOfBatchTextField]
        textFields.enableButton(bottomAddButton)
    }
    
    func addToCoreData() {
        let newHop = coreDataManager.createHop()
        guard let hopName = hopNameTextField.text,
              let hopWeight = hopWeightTextField.text,
              let hopAlphaAcid = hopAlphaAcidTextField.text,
              let hopBoilTime = hopBoilTimeTextField.text,
              let hopGravity = hopGravityOfBatchTexfield.text,
              let hopVolume = hopVolumeOfBatchTextField.text,
              let weight = Double(hopWeight),
              let gravity = Double(hopGravity),
              let alphaAcid = Double(hopAlphaAcid),
              let time = Double(hopBoilTime),
              let volume = Double(hopVolume)
        else { return }
        
        let platoToSG = 1 + (gravity / (258.6 - ((gravity / 258.2) * 227.1)))
        let fg = 1.65 * pow(0.000125, platoToSG - 1)
        let ft = (1 - pow(2.718281828459, (-0.04 * time))) / 4.15
        let ibu = weight * alphaAcid * fg * ft * Double(10 / volume)
        let roundedIBU = String(format: "%.2f", ibu)

        newHop.name = hopName
        newHop.weight = hopWeight
        newHop.alphaAcid = hopAlphaAcid
        newHop.time = hopBoilTime
        newHop.gravity = hopGravity
        newHop.volume = hopVolume
        newHop.result = roundedIBU
        delegate?.add(self, didFinish: newHop)
    }
    
    func wrongData() {
        bottomAddButton.backgroundColor = .systemRed
        bottomAddButton.setTitle("Wrong data:", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.bottomAddButton.backgroundColor = .systemGray
            self.bottomAddButton.setTitle("Add", for: .normal)
        }
    }
        
    @IBAction func bottomAddButtonPressed(_ sender: UIButton) {
        addToCoreData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
