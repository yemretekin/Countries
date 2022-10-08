//
//  DetailViewController.swift
//  Countries
//
//  Created by Emre Tekin on 6.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var navigation: UINavigationItem!
    @IBOutlet weak var imageView: UIImageView!
    
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
    
    
    //var selectedCountryImage = UIImage()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigation.title = selectedName
        codeLabel.text = defaultHeader + selectedCode
        
        
        
        
        countryManager.parsingJson { data in
            self.countDetailData = data
            DispatchQueue.main.async {
                print(self.countDetailData)
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



