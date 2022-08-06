//
//  DataLoader.swift
//  beerManager2
//
//  Created by Michał Massloch on 24/08/2021.
//

import Foundation

public class DataLoader {
    var beerData = [Style]()
    
    init(){
        load()
    }
    //Loading data from beerStyles.json
    func load() {
        if let bundle = Bundle.main.url(forResource: "beerStyles", withExtension: "json") {
            do {
                let data = try Data(contentsOf: bundle)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Style].self, from: data)
                self.beerData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
