//
//  MenuViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var gravityView: UIView!
    @IBOutlet weak var carbonationView: UIView!
    @IBOutlet weak var alcoholView: UIView!
    @IBOutlet weak var ibuView: UIView!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var gravityButtonLabel: UIButton!
    @IBOutlet weak var carbonationButtonLabel: UIButton!
    @IBOutlet weak var alcoholButtonLabel: UIButton!
    @IBOutlet weak var ibuButtonLabel: UIButton!
    @IBOutlet weak var nagazowanieLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        nagazowanieLabel.layer.shadowRadius = 3
        nagazowanieLabel.layer.shadowOpacity = 1
        nagazowanieLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        gravityButtonLabel.layer.shadowColor = UIColor.black.cgColor
        gravityButtonLabel.layer.shadowOffset = CGSize(width: 0, height: 3)
        gravityButtonLabel.layer.shadowRadius = 3
        gravityButtonLabel.layer.shadowOpacity = 1.0
        
//        carbonationButtonLabel.layer.shadowColor = UIColor.black.cgColor
//        carbonationButtonLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
//        carbonationButtonLabel.layer.shadowRadius = 3
//        carbonationButtonLabel.layer.shadowOpacity = 1.0
        
        alcoholButtonLabel.layer.shadowColor = UIColor.black.cgColor
        alcoholButtonLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
        alcoholButtonLabel.layer.shadowRadius = 3
        alcoholButtonLabel.layer.shadowOpacity = 1.0
        
        ibuButtonLabel.layer.shadowColor = UIColor.black.cgColor
        ibuButtonLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
        ibuButtonLabel.layer.shadowRadius = 3
        ibuButtonLabel.layer.shadowOpacity = 1.0
        
        
        gravityView.layer.shadowColor = UIColor.black.cgColor
        gravityView.layer.shadowOpacity = 0.8
        gravityView.layer.shadowOffset = .zero
        gravityView.layer.shadowRadius = 8
        gravityView.layer.cornerRadius = 10
        
        carbonationView.layer.shadowColor = UIColor.black.cgColor
        carbonationView.layer.shadowOpacity = 0.8
        carbonationView.layer.shadowOffset = .zero
        carbonationView.layer.shadowRadius = 8
        carbonationView.layer.cornerRadius = 10
        
        alcoholView.layer.shadowColor = UIColor.black.cgColor
        alcoholView.layer.shadowOpacity = 0.8
        alcoholView.layer.shadowOffset = .zero
        alcoholView.layer.shadowRadius = 8
        alcoholView.layer.cornerRadius = 10
        
        ibuView.layer.shadowColor = UIColor.black.cgColor
        ibuView.layer.shadowOpacity = 0.8
        ibuView.layer.shadowOffset = .zero
        ibuView.layer.shadowRadius = 8
        ibuView.layer.cornerRadius = 10
        
        testView.layer.shadowColor = UIColor.black.cgColor
        testView.layer.shadowOpacity = 0.8
        testView.layer.shadowOffset = .zero
        testView.layer.shadowRadius = 8
        testView.layer.cornerRadius = 10

    }
}
