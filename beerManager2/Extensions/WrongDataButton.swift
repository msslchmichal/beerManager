//
//  WrongDataButton.swift
//  beerManager2
//
//  Created by Michał Massloch on 12/03/2023.
//

import UIKit

//MARK: - extension for all calculate button appearance

extension UIViewController {
    func wrongData(error: String, countButton: UIButton) {
        countButton.backgroundColor = .systemRed
        countButton.setTitle("Wrong data: \(error)", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            countButton.backgroundColor = .systemGreen
            countButton.setTitle("Calculate", for: .normal)
        }
    }
}
