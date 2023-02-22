//
//  RestaurantStruct.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import Foundation
struct RestaurantStruct {
    var tittle : String
    var desc : String
    var price : Int
    var adress : String
    
    //list of orders
    var orders : [Orders]
    var image : String

}


struct Orders {
    var menu : String
    var price : Int
    
}


