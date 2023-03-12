//
//  EnableButton.swift
//  beerManager2
//
//  Created by Michał Massloch on 12/03/2023.
//

import UIKit

//MARK: - extension for enabling calculate/add button when alle textFields are filled

extension Array where Element == UITextField{
    func enableButton(_ button: UIButton) {
        let allTextFieldsHaveText = self.allSatisfy { $0.text?.isEmpty == false }
        button.isEnabled = allTextFieldsHaveText
        button.backgroundColor = allTextFieldsHaveText ? UIColor.systemGreen : UIColor.systemGray
    }
}
