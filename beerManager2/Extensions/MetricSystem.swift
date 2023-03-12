//
//  MetricSystem.swift
//  beerManager2
//
//  Created by Michał Massloch on 12/03/2023.
//

import UIKit

//MARK: - extension for loading metric system in calculators

extension UIViewController {
    func loadMetricSystem() {
        let defaults = UserDefaults.standard
        _ = defaults.bool(forKey: "isMetric")
    }
}
