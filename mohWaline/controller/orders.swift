//
//  orders.swift
//  mohWaline
//
//  Created by youssef on 7/7/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class orders: UIViewController {

    @IBOutlet weak var tableOrder: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableOrder.delegate = self
        tableOrder.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension orders : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ordercell", for: indexPath)
        
        return cell
    }
    
    
}

extension orders : UITableViewDelegate{
    
}
