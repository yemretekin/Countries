//
//  CountriesManager.swift
//  Countries
//
//  Created by Emre Tekin on 7.10.2022.
//


import UIKit
import WebKit

struct CountriesManager {
    
    
    let urlString = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10&rapidapi-key=59e9d5f1c4msh71c807f49e19391p161c03jsn32b3f446da14"
    
    


    func parsingJson(completion: @escaping ([Country]) -> () ){

    let url = URL(string: urlString)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if error == nil , data != nil {
            
            let decoder = JSONDecoder()
            do{
                let ParsingData = try decoder.decode(CountriesData.self, from: data!)
                completion(ParsingData.data)
                
            }catch{
                print("Pars error.")
            }
            
        }
    }
    dataTask.resume()
    
    
}
    
    func parseJsonDetails(completion: @escaping (CountryDetail) -> () ){

        let url = URL(string: urlString)
        guard url != nil else {
            print("error")
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil , data != nil {
                
                let decoder = JSONDecoder()
                do{
                    let ParsingData = try decoder.decode(CountryDetails.self, from: data!)
                    completion(ParsingData.data)
                    
                }catch{
                    print("Parsing error.")
                }
                
            }
        }
        dataTask.resume()
    
}
    
    


}
