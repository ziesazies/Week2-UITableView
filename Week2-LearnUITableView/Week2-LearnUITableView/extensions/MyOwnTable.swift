//
//  MyOwnTable.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import Foundation
import UIKit

class MyOwnTableView: UITableView {
override var intrinsicContentSize: CGSize {
   self.layoutIfNeeded()
   return self.contentSize
}

override var contentSize: CGSize {
   didSet{
       self.invalidateIntrinsicContentSize()
   }
}

override func reloadData() {
   super.reloadData()
   self.invalidateIntrinsicContentSize()
}
}
