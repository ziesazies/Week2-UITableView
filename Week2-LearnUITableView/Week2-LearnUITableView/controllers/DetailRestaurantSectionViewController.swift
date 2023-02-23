//
//  DetailRestaurantSectionViewController.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 23/02/23.
//

import UIKit

class DetailRestaurantSectionViewController: UIViewController {
    
    var restaurant: RestaurantStruct?
    
    static let identifier = "restaurantDetailSection"

    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        
        detailTableView.register(UINib(nibName: "FirstCell", bundle: nil), forCellReuseIdentifier: "firstCell")
        detailTableView.register(UINib(nibName: "OrderCell", bundle: nil), forCellReuseIdentifier: "orderCell")
        detailTableView.register(UINib(nibName: "ThirdCell", bundle: nil), forCellReuseIdentifier: "thirdCell")
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        detailTableView.separatorStyle = .none
    }
    
    
}

extension DetailRestaurantSectionViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstCell else {return UITableViewCell()}
            cell.restaurantImage.image = UIImage(named: restaurant!.image)
            return cell
        case 1:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as? OrderCell else{return UITableViewCell()}
            cell.menuOrderLabel.text = restaurant?.orders[indexPath.row].menu
            cell.priceOrderLabel.text = "Rp\(restaurant?.orders[indexPath.row].price ?? 0)"
            return cell
        case 2:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? ThirdCell else{return UITableViewCell()}
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return (restaurant?.orders.count)!
        case 2:
            return 1
        default:
            return 0
        }
    }
    
}

extension UIViewController {
    func navigateToDetailSection(_ restaurant: RestaurantStruct) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "restaurantDetailSection") as! DetailRestaurantSectionViewController
        vc.restaurant = restaurant
        navigationController?.pushViewController(vc, animated: true)
    }
}
