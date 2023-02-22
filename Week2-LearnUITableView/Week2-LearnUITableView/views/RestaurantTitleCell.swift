//
//  RestaurantTitleCell.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class RestaurantTitleCell: UITableViewCell {
    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantAbout: UILabel!
    
    var restaurant: RestaurantStruct?
    
    static let identifier = "detailRestaurant"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupOrderCell()
    }
    
    func getDataFromDetail(_ restaurant: RestaurantStruct!) {
        self.restaurant = restaurant
    }
    
    func setupOrderCell(){
        let orderCellNib = UINib(nibName: "OrderCell", bundle: nil)
        orderTableView.register(orderCellNib, forCellReuseIdentifier: "orderCell")
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.estimatedRowHeight = 40.0;
    }
    
}

extension RestaurantTitleCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as? OrderCell else { return UITableViewCell()}
        
        cell.menuOrderLabel.text = restaurant?.orders[indexPath.row].menu
        guard let foodPrice = restaurant?.orders[indexPath.row].price else { return UITableViewCell() }
        cell.priceOrderLabel.text = "$\(foodPrice)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (restaurant?.orders.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
