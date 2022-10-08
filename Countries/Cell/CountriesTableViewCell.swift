//
//  CountriesTableViewCell.swift
//  Countries
//
//  Created by Emre Tekin on 6.10.2022.
//

import UIKit

class CountriesTableViewCell: UITableViewCell, UINavigationControllerDelegate {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    @IBOutlet weak var cellView: UIView!
    var code = ""
    
    var savedItem = [Country]()
    
    var flag = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model:Country){
        self.cellLabel.text = model.name
        self.code = model.code ?? ""
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func cellButtonClicked(_ sender: UIButton) {
        if flag == false {
        cellButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    
            flag = true
        }else{
            cellButton.setImage(UIImage(systemName: "star"), for: .normal)
            flag = false
        }
            
            }
    
            }
    
    
        



