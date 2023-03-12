//
//  NetworkManager.swift
//  beerManager2
//
//  Created by Michał Massloch on 08/03/2023.
//

import Foundation

class NetworkManager {
    let endpoint: String
    
    init(endpoint: String) {
        self.endpoint = endpoint
    }
    
    func sendRequest(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: endpoint) else {
            completionHandler(nil, nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: completionHandler).resume()
    }
}
