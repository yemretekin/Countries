//
//  SavedTableViewCell.swift
//  Countries
//
//  Created by Emre Tekin on 9.10.2022.
//

import UIKit

class SavedTableViewCell: UITableViewCell,UINavigationControllerDelegate {

    @IBOutlet weak var savedCellLabel: UILabel!
    @IBOutlet weak var savedCellButton: UIButton!
    
    var flag = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    @IBAction func savedCellButtonClicked(_ sender: UIButton) {
        if flag == false {
        savedCellButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
    
            flag = true
        }else{
        savedCellButton.setImage(UIImage(systemName: "star"), for: .normal)
            flag = false
        }
        
    }
    
}
