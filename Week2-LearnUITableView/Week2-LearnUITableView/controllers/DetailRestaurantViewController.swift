//
//  DetailRestaurantViewController.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class DetailRestaurantViewController: UIViewController {
    
    var restaurant: RestaurantStruct?
    
    static let identifier = "restaurantDetail"
    @IBOutlet weak var detailRestaurantTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }
    
    func setUpTableView(){
        
        let detailRestaurantNib = UINib(nibName: "RestaurantTitleCell", bundle: nil)
        detailRestaurantTableView.register(detailRestaurantNib, forCellReuseIdentifier: "detailRestaurant")
        
        detailRestaurantTableView.delegate = self
        detailRestaurantTableView.dataSource = self
        
        
    }

}

extension DetailRestaurantViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = detailRestaurantTableView.dequeueReusableCell(withIdentifier: "detailRestaurant", for: indexPath) as? RestaurantTitleCell else{
            return UITableViewCell()
        }
        
        cell.setupOrderCell()
        cell.restaurantTitle.text = restaurant?.tittle
        cell.restaurantImage.image = UIImage(named: restaurant?.image ?? "Image")
        cell.restaurantAddress.text = restaurant?.adress
        cell.getDataFromDetail(restaurant)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension UIViewController {
    func navigateToDetail(_ restaurant: RestaurantStruct) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "restaurantDetail") as! DetailRestaurantViewController
        vc.restaurant = restaurant
        navigationController?.pushViewController(vc, animated: true)
    }
}
