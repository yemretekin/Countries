//
//  ViewController.swift
//  Countries
//
//  Created by Emre Tekin on 6.10.2022.
//

import UIKit

class HomeViewController: UIViewController{
    
    var countryCode = ""
    var countryName = ""
    var countryId = ""

    
    @IBOutlet var tableView: UITableView!
    
    let cellSpacingHeight: CGFloat = 5.0
    
    
    var countriesManager = CountriesManager()
    var countData =  [Country]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        cellSettings()
        countriesManager.parsingJson { data in
            self.countData = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    

    
        
    

    
    func cellSettings() {
        
        let nib = UINib(nibName: "CountriesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CountriesTableViewCell")
        
        self.view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
    
    
   
}
    
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryCode = countData[indexPath.section].code!
        countryName = countData[indexPath.section].name!
        countryId = countData[indexPath.section].wikiDataId ?? ""

        
        performSegue(withIdentifier: "toDetailsVC", sender:nil)
        

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as? DetailViewController
            destinationVC?.selectedCode = countryCode
            destinationVC?.selectedName = countryName
            destinationVC?.wikiId = countryId
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableViewCell", for: indexPath) as! CountriesTableViewCell
        cell.cellLabel.text = countData[indexPath.section].name
        cell.layer.cornerRadius = 20
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        return cell
    }
    
    
    
    
}
