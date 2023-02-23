//
//  RestaurantListViewController.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    var restaurantList: [RestaurantStruct] = [
        RestaurantStruct(tittle: "El Pachucho", desc: "Best Nachos in Town", price: 15, adress: "gandaria", orders:
                            [
                                Orders(menu: "The Fried Chicken Bun", price: 12),
                                Orders(menu: "Tacos Criollo", price: 12 ),
                                Orders(menu: "Pancakes", price: 6)
                            ], image: "Image"),
        RestaurantStruct(tittle: "Taco Alto", desc: "Mexican-American", price: 15, adress: "cikampek", orders:
                            [
                                Orders(menu: "Sate", price: 8),
                                
                            ],
                         image: "Image2"),
        RestaurantStruct(tittle: "La Taquera", desc:"Asian-Indonesia" , price: 9, adress: "cirebon", orders:
                            [Orders(menu: "seblak", price: 10)], image: "Image3")
    ]
    
    
    @IBOutlet weak var restaurantListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpTableView()
    }
    
    func setUpTableView(){
        let listRestaurantNib = UINib(nibName: "ListRestaurantCell", bundle: nil)
        restaurantListView.register(listRestaurantNib, forCellReuseIdentifier: "listRestaurant")
        
        restaurantListView.delegate = self
        restaurantListView.dataSource = self
        
    }
   

}

extension RestaurantListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = restaurantListView.dequeueReusableCell(withIdentifier: "listRestaurant", for: indexPath) as? ListRestaurantCell else{
            return UITableViewCell()
        }
        cell.restaurantTitle.text = restaurantList[indexPath.row].tittle
        cell.restaurantDesc.text = restaurantList[indexPath.row].desc
        cell.restaurantPrice.text = "$ \(restaurantList[indexPath.row].price)"
        cell.restaurantImage.image = UIImage(named: restaurantList[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//        if let detail = storyboard.instantiateViewController(withIdentifier: "restaurantDetail") as? DetailRestaurantViewController{
//            self.navigationController?.pushViewController(detail, animated: true)}
        
//        navigateToDetail(restaurantList[indexPath.row])
        navigateToDetailSection(restaurantList[indexPath.row])
    }
}

