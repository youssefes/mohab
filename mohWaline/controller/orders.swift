//
//  orders.swift
//  mohWaline
//
//  Created by youssef on 7/7/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class orders: UIViewController {

    var orderArray = [orderData]()
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6Ly93d3cuZWx3YWxpbWEuY29tL2Vsd2FsaW1hX2JldGEvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTYyNTA2NjU2LCJleHAiOjM2MDAwMDAwMDE1NjI1MDY2NTYsIm5iZiI6MTU2MjUwNjY1NiwianRpIjoiakdKUGhiUUJUQlJNbk1jMyJ9.jzo1OhFXfrWLdiq6Bbo2XIzT-6FCvMEXEciJx_gP_gI"
    
    @IBOutlet weak var tableOrder: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableOrder.delegate = self
        tableOrder.dataSource = self
        tableOrder.tableFooterView = UIView()
        tableOrder.separatorInset = .zero
        tableOrder.contentInset = .zero
        getOrderData()
    }
    

    func getOrderData(){
        API.OrderDetails(token: token, len: "en") { (status, msg, orderData) in
            if status{
                if let message = msg{
                    print(message)
                    if let dataReturn = orderData{
                        self.orderArray = dataReturn
                        self.tableOrder.reloadData()
                    }
                }
            }
        }
    }
}

extension orders : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "ordercell", for: indexPath) as? orderCell{
            if let id = orderArray[indexPath.row].id{
                 cell.orderId.text = "orderId-\(id)"
            }
           
            cell.orderDate.text = orderArray[indexPath.row].created_at
            
            cell.status.text = orderArray[indexPath.row].status
            return cell
        }else{
            return UITableViewCell()
        }
        
       
        
        
    }
    
    
}

extension orders : UITableViewDelegate{
    
}
