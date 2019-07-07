//
//  TableViewCell.swift
//  mohabProject
//
//  Created by youssef on 7/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class resultCell: UITableViewCell {

    @IBOutlet weak var ViewRating: UIView!
    @IBOutlet weak var lbladdress: UILabel!
    @IBOutlet weak var lblFoodType: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
