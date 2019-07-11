//
//  orderCell.swift
//  mohWaline
//
//  Created by youssef on 7/7/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class orderCell: UITableViewCell {


    @IBOutlet weak var orderId: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBAction func cancelBtnAction(_ sender: Any) {
    }
    
    @IBAction func repatedOrder(_ sender: Any) {
    }
}
