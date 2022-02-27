//
//  CountryModel.swift
//  Countries
//
//  Created by Batuhan Mıcık on 25.02.2022.
//

import Foundation

struct Countries : Codable{
    let data : [CountryResult]
}

struct CountryResult: Codable, Identifiable, Hashable{
    let code: String
    let name: String
    var id: String{code}
    
    enum CodingKeys: String, CodingKey{
        case code, name
    }
}
