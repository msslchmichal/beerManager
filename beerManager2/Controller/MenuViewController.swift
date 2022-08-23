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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let views: [UIView] = [gravityView,carbonationView,alcoholView,ibuView]
        for view in views {
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = .zero
            view.layer.shadowRadius = 10
            view.layer.cornerRadius = 10
        }
        
        let labels: [UIButton] = [gravityButtonLabel,carbonationButtonLabel,alcoholButtonLabel,ibuButtonLabel]
        for label in labels {
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize(width: 0, height: 3)
            label.layer.shadowRadius = 2
            label.layer.shadowOpacity = 0.8
        }
    }
}
