//
//  String+CommaToDot.swift
//  beerManager2
//
//  Created by Michał Massloch on 11/02/2022.
//

import Foundation

//MARK: - extension for String to replace , to . for counting

extension String {
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
}
