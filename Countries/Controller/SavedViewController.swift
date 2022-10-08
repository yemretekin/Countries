//
//  SavedViewController.swift
//  Countries
//
//  Created by Emre Tekin on 6.10.2022.
//

import UIKit

class SavedViewController: UIViewController{
   
    var homeData: [String] = ["Hilal","Emre"]

    @IBOutlet weak var savedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        savedTableView.delegate = self
        savedTableView.dataSource = self
        
        let nib = UINib(nibName: "CountriesTableViewCell", bundle: nil)
        savedTableView.register(nib, forCellReuseIdentifier: "CountriesTableViewCell")
        

    }

    
    
    
    
    
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableViewCell", for: indexPath) as! CountriesTableViewCell
        cell.cellLabel.text = homeData[indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeData.count
    }
    
}
