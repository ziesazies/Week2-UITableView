//
//  FirstCell.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 23/02/23.
//

import UIKit

class FirstCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openCloseLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    static let identifier = "firstCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        
}
