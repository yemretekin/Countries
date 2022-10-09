//
//  SavedViewController.swift
//  Countries
//
//  Created by Emre Tekin on 6.10.2022.
//

import UIKit

class SavedViewController: UIViewController{
   
    var homeData = [String]()
    
    var cellSpacingHeight: CGFloat = 5.0


    @IBOutlet weak var savedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        savedTableView.delegate = self
        savedTableView.dataSource = self
        
        cellSettings()
        

    }
    
    func cellSettings() {
        
        let nib = UINib(nibName: "SavedTableViewCell", bundle: nil)
        savedTableView.register(nib, forCellReuseIdentifier: "SavedTableViewCell")
        
        self.view.addSubview(savedTableView)
        savedTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0).isActive = true
        savedTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
    
    
   
}

    
    
    
    
    
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedTableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell") as! SavedTableViewCell
        cell.savedCellLabel.text = homeData[indexPath.row]
        cell.layer.cornerRadius = 20
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeData.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}

