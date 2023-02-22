//
//  ListFoodTypeCell.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class ListFoodTypeCell: UITableViewCell {
    
    static let identifier = "foodTypeCell"

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var placeCountButton: UIButton!

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
