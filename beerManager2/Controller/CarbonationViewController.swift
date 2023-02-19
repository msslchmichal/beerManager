//
//  CarbonationViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
// TODO: gray add button until all textfields are filled with data

import UIKit

class CarbonationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var chosenBeerStyle = ""
    var minCarbonation: Double = 0.0
    var maxCarbonation: Double = 0.0
    var sugarIndex = 0
    var beerCarbonation = BeerCarbonation()
    
    @IBOutlet weak var sugarSegmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var stylePickerView: UIPickerView!
    @IBOutlet weak var amountToBottle: UITextField!
    @IBOutlet weak var temperatureOfBottling: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylePickerView.dataSource = self
        stylePickerView.delegate = self
        resultLabel.text = " "
        sugarIndexChanged(0)
        stylePickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    @IBAction func sugarIndexChanged(_ sender: Any) {
        sugarIndex = sugarSegmentedControl.selectedSegmentIndex
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return beerCarbonation.styles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return beerCarbonation.styles[row].styleName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = beerCarbonation.styles[row].styleName
        let lowerBoundOfChosenBeerStyle = beerCarbonation.styles[row].minCarbonation
        let upperBoundOfChosenBeerStyle = beerCarbonation.styles[row].maxCarbonation
        chosenBeerStyle = selected
        minCarbonation = lowerBoundOfChosenBeerStyle
        maxCarbonation = upperBoundOfChosenBeerStyle
    }
    
    @IBAction func countButtonPressed(_ sender: Any) {
        let amount = amountToBottle.text!
        let temperature = temperatureOfBottling.text!
        if maxCarbonation == 0 {
            maxCarbonation = beerCarbonation.styles[0].maxCarbonation
            minCarbonation = beerCarbonation.styles[0].minCarbonation
        }
        let result = beerCarbonation.carbonationCalculation(primerType: sugarIndex, maxForChosenStyle: maxCarbonation, minForChosenStyle: minCarbonation, amount: amount, temperature: temperature)
        resultLabel.text = result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

