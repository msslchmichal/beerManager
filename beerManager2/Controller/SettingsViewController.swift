//
//  SettingsViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/03/2023.
//
//TODO: Add more settings

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var unitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPopUpButton()
    }
    func setupPopUpButton() {
        let defaults = UserDefaults.standard
        let isMetric = defaults.bool(forKey: "isMetric")

        let settingsActionHandler = { (action: UIAction) in
            switch(action.title) {
            case "Metric":
                defaults.set(true, forKey: "isMetric")
            case "Imperial":
                defaults.set(false, forKey: "isMetric")
            default:
                print("error")
            }
            defaults.synchronize()
        }

        unitButton.menu = UIMenu(children: [
            UIAction(title: "Metric", state: isMetric ? .on : .off, handler: settingsActionHandler),
            UIAction(title: "Imperial", state: !isMetric ? .on : .off, handler: settingsActionHandler)
        ])
        unitButton.showsMenuAsPrimaryAction = true
    }
}
