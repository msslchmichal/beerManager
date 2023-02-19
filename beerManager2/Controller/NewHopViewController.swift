//
//  NewHopViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 26/03/2022.
// TODO: result

import UIKit

protocol NewHopViewControllerDelegate: AnyObject {
    func add(_ controller: NewHopViewController, didFinish hop: Hop)
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
    
    var hop: Hop?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    weak var delegate: NewHopViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomAddButton.backgroundColor = UIColor.systemGray
        bottomAddButton.isEnabled = false
        
        [hopNameTextField, hopWeightTextField, hopAlphaAcidTextField, hopBoilTimeTextField, hopGravityOfBatchTexfield, hopVolumeOfBatchTextField].forEach { (field) in
            field?.addTarget(self,
                             action: #selector(editingChanged(_:)),
                             for: .editingChanged)
        }
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        
        guard
            let hopName = hopNameTextField.text, !hopName.isEmpty,
            let hopWeight = hopWeightTextField.text, !hopWeight.isEmpty,
            let hopAlphaAcid = hopAlphaAcidTextField.text, !hopAlphaAcid.isEmpty,
            let hopBoilTime = hopBoilTimeTextField.text, !hopBoilTime.isEmpty,
            let hopGravity = hopGravityOfBatchTexfield.text, !hopGravity.isEmpty,
            let hopVolume = hopVolumeOfBatchTextField.text, !hopVolume.isEmpty
        else {
            bottomAddButton.isEnabled = false
            bottomAddButton.backgroundColor = UIColor.systemGray
            return
        }
        bottomAddButton.isEnabled = true
        bottomAddButton.backgroundColor = UIColor.systemGreen
    }
    
    func addToCoreData() {
        let newHop = Hop(context: self.context)
        newHop.name = self.hopNameTextField.text!
        newHop.weight = self.hopWeightTextField.text!
        newHop.alphaAcid = self.hopAlphaAcidTextField.text!
        newHop.time = self.hopBoilTimeTextField.text!
        newHop.gravity = self.hopGravityOfBatchTexfield.text!
        newHop.volume = self.hopVolumeOfBatchTextField.text!
        let result = {
            guard let unwWeight = self.hopWeightTextField.text, let unwGravity = self.hopGravityOfBatchTexfield.text, let unwAa = self.hopAlphaAcidTextField.text, let unwTime = self.hopBoilTimeTextField.text, let unwVolume = self.hopVolumeOfBatchTextField.text else {
                return "empty textfield"
            }
            
            guard let weightDouble = Double(unwWeight), let gravityDouble = Double(unwGravity), let aaDouble = Double(unwAa), let timeDouble = Double(unwTime), let volumeDouble = Double(unwVolume) else {
                return "unknown error"
            }
            
            let platoToSG = 1+(gravityDouble/(258.6-((gravityDouble/258.2)*227.1)))
            print("platoToSG: \(platoToSG)")
            let fg = 1.65 * pow(0.000125, platoToSG-1)
            print("fg \(fg)")
            let ft = (1-pow(2.718281828459, (-0.04*timeDouble)))/4.15
            print("ft \(ft)")
            let ekstraktywnosc = fg*ft
            print(ekstraktywnosc)
            let ibu = weightDouble * aaDouble * ekstraktywnosc * Double(10/volumeDouble)
            print("ibu = \(weightDouble) * \(aaDouble) * \(ekstraktywnosc) * \(Double(10/volumeDouble))")
            print("ibu: \(ibu)")
            let roundedIBU = String(format: "%.2f", ibu)
            print("roundedIBU: \(roundedIBU)")
            return roundedIBU
        }
        newHop.result = result()
        self.delegate?.add(self, didFinish: newHop)
        
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
        addToCoreData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
