//
//  DetailViewController.swift
//  Countries
//
//  Created by Emre Tekin on 6.10.2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var navigation: UINavigationItem!
    @IBOutlet weak var imageView: WKWebView!
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    var flag = false
    
    var selectedCode = ""
    var selectedImage = UIImage()
    var defaultHeader = "Country Code: "
    var selectedName = ""
    var wikiId = ""
    
    var countryManager = CountriesManager()
    var countDetailData =  [Country]()
    var homeVC = HomeViewController()



    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(wikiId)?limit=10&rapidapi-key=59e9d5f1c4msh71c807f49e19391p161c03jsn32b3f446da14"
        
        if let url = URL(string: urlString) {
                    if let data = try? Data(contentsOf: url) {
                        parseDetail(data: data)
                    }
                }
        
        
        
        navigation.title = selectedName
        codeLabel.text = defaultHeader + selectedCode

        
        
        }
    func parseDetail(data: Data) {
            let decoder = JSONDecoder()
            if let countriesDetails = try? decoder.decode(CountryDetails.self, from: data) {
                navigation.title = countriesDetails.data.name
                codeLabel.text = countriesDetails.data.code
                wikiId = countriesDetails.data.wikiDataId ?? ""
                
                if let imageUrl = URL(string: countriesDetails.data.flagImageUri ?? "") {
                    imageView.load(URLRequest(url: imageUrl))
                    imageView.contentMode = .scaleToFill
                                }


    
                                       
                }
            }
    
   

    

    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func informationButtonClicked(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.wikidata.org/wiki/\(wikiId)")!)
            
    }
    @IBAction func favButtonClicked(_ sender: Any) {
        }
            
            
        }



