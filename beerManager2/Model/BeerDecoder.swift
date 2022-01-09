//
//  BeerDecoder.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/01/2022.
//

import Foundation

private func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    return nil
}
