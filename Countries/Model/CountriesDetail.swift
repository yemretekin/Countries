//
//  CountriesDetail.swift
//  Countries
//
//  Created by Emre Tekin on 8.10.2022.
//

import Foundation

struct CountryDetails : Decodable {
    let data : CountryDetail
}

struct CountryDetail : Decodable {
    let code : String?
    let flagImageUri : String?
    let name : String?
    let wikiDataId : String?
}
