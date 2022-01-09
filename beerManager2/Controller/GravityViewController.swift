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
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @IBAction func countButtonPressed(_ sender: UIButton) {
        //print("button pressed")
        let gestoscConv: Double? = Double(gravityTextField.text!)
        let temperaturaConv: Double? = Double(temperatureTextField.text!)

        if let safeGestosc = gestoscConv, let safeTemperatura = temperaturaConv {
            if safeGestosc > 0.0 && safeTemperatura > 0.0 {
                    //print("sa wieksze od 0")
                //print(String(safeGestosc) + " " + String(safeTemperatura))
                let wynik = gravityCorrection(gravity: safeGestosc, temperature: safeTemperatura)
                resultLabel.text = "Poprawna gestosc: " + String(format: "%.2f", wynik)
            }
            else {
                //print("nie sa wieksze od 0")
                zleDane()
            }

        }
        else {
            zleDane()
        }
   }

    func gravityCorrection(gravity: Double, temperature: Double) -> Double {
        let wspolczynnik = 0.075
        let wynik = ((temperature-20)*wspolczynnik)+gravity
        return wynik
    }

    func zleDane() {
        countButton.backgroundColor = UIColor.systemRed
        countButton.setTitle("Błędne dane, wpisz ponownie", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.countButton.backgroundColor = UIColor.systemGreen
            self.countButton.setTitle("Oblicz", for: .normal)
        }
        //print("nic tu nie ma")

    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
