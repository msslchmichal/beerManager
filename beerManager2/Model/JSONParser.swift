//
//  JSONParser.swift
//  beerManager2
//
//  Created by Michał Massloch on 08/03/2023.
//

import Foundation
enum JSONParsingError: Error {
    case fileNotFound
    case decodingError
}

class JSONParser<T: Decodable> {

    func parse(data: Data) -> Result<T, Error> {
        do {
            let jsonDecoder = JSONDecoder()
            let parsedData = try jsonDecoder.decode(T.self, from: data)
            return .success(parsedData)
        } catch {
            return .failure(error)
        }
    }
    func parseLocalFile(named filename: String) -> Result<T, Error> {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json")
        else { return .failure(JSONParsingError.fileNotFound) }
        
        do {
            let data = try Data(contentsOf: url)
            return parse(data: data)
        } catch {
            return .failure(error)
        }
    }

    
    
}
