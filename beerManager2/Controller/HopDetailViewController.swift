//
//  HopDetailViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 18/02/2023.
//
// TODO: details 

import UIKit

class HopDetailViewController: UIViewController {

    var hop: Hop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = hop?.name
        // Do any additional setup after loading the view.
    }
}
