//
//  ListRestaurantCell.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class ListRestaurantCell: UITableViewCell {
    
    static let identifier = "listRestaurant"
    
    @IBOutlet weak var restaurantPrice: UILabel!
//    {
//        didSet{
//            restaurantPrice.text = "$15/person"
//
//        }
//    }
    @IBOutlet weak var restaurantImage: UIImageView!
//    {
////        didSet{
////            restaurantImage.image = UIImage(named: "image")
////        }
//    }
    
    @IBOutlet weak var restaurantDesc: UILabel!
//        {
//        didSet{
//            restaurantDesc.text = "best bachos in town"
//        }
//    }
    
    @IBOutlet weak var restaurantTitle: UILabel!
//        {
//        didSet{
//            restaurantTitle.text = "El Pachuco"
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
