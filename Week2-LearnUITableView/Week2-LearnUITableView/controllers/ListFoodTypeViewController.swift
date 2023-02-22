//
//  ViewController.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class ListFoodTypeViewController: UIViewController {
    
    
    var foodTypeList = ["Spanish", "Asian", "Latino", "American", "Brunch", "Vegetarian", "Italiano"]

    @IBOutlet weak var listFoodTypeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(rgb: 0xF4F4F4)
        setupTableView()
        
    }
    
    func setupTableView() {
        let listFoodTypeNib = UINib(nibName: "ListFoodTypeCell", bundle: nil)
        listFoodTypeTableView.register(listFoodTypeNib, forCellReuseIdentifier: "foodTypeCell")
        
        listFoodTypeTableView.separatorColor = .yellow
        
        listFoodTypeTableView.delegate = self
        listFoodTypeTableView.dataSource = self
        
    }


}



extension ListFoodTypeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard  let cell = listFoodTypeTableView.dequeueReusableCell(withIdentifier: "foodTypeCell", for: indexPath) as? ListFoodTypeCell else {return UITableViewCell()}
        guard let cell = listFoodTypeTableView.dequeueReusableCell(withIdentifier: "foodTypeCell", for: indexPath) as? ListFoodTypeCell else {return UITableViewCell()}
        cell.foodTypeLabel.text = foodTypeList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    // buat dipencet2
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let list = storyboard.instantiateViewController(withIdentifier: "restaurantListIdentifier") as? RestaurantListViewController{
            self.navigationController?.pushViewController(list, animated: true)
        }
    }
}
