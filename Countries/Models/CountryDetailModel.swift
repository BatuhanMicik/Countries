//
//  CountryDetailModel.swift
//  Countries
//
//  Created by Batuhan Mıcık on 25.02.2022.
//

import Foundation

struct CountryDetail: Codable{
    let data: CountryDetails
}

struct CountryDetails: Codable{
    let name: String
    let code: String
    let flagImageURL: String
    let wikiDataID: String
    
    enum CodingKeys: String, CodingKey{
        case wikiDataID = "wikiDataId"
        case flagImageURL = "flagImageUri"
        case name, code
    }
}
