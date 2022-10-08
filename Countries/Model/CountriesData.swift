//
//  CountriesData.swift
//  Countries
//
//  Created by Emre Tekin on 6.10.2022.
//

import Foundation

struct CountriesData: Decodable {
    let data: [Country]

}
struct Country: Decodable {
    let code: String?
    let name, wikiDataID: String?
    }


