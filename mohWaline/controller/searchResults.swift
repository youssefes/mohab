//
//  ViewController.swift
//  mohabProject
//
//  Created by youssef on 7/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import TinyConstraints
import Cosmos
import Kingfisher

class searchResults: UIViewController {
    
    fileprivate func cosmonView (retaing : Double ) -> CosmosView {
        var cosmosView : CosmosView{
            let view = CosmosView()
            view.settings.updateOnTouch = false
            view.rating = retaing
            return view
        }
        return cosmosView
    }

    var allResult = [resultdata]()
    @IBOutlet weak var tableViewResult: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewResult.dataSource = self
        self.tableViewResult.delegate = self
        print(allResult)
        // Do any additional setup after loading the view.
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }

}
extension searchResults : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allResult.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as? resultCell{
            let name = allResult[indexPath.row].name
            if name == nil {
                cell.lblName.text = "moha"
            }else{
               cell.lblName.text = name
            }
            
            if let address = allResult[indexPath.row].address{
                cell.lbladdress.text = address
            }
            
            let foodTypt = allResult[indexPath.row].foodTypes
            
            if foodTypt?.count == 0{
                cell.lblFoodType.text = "Egyption"
            }else{
                cell.lblFoodType.text = foodTypt?.joined(separator: "&")
            }
            
            
            
            if let reting = allResult[indexPath.row].review{
                let view = cosmonView(retaing: Double(reting))
                cell.ViewRating.addSubview(view)
                view.centerInSuperview()
            }
            
            if let image = allResult[indexPath.row].image{
                DispatchQueue.main.async {
                    if image == "http://www.elwalima.com/elwalima_beta/public//uploads/restaurants"{
                        cell.mainImage.image = UIImage(named: "restont.jpeg")
                    }else{
                        cell.mainImage.kf.indicatorType = .activity
                        cell.mainImage.kf.setImage(with: URL(string: image))
                    }
                    
                    
                }
            }else{
                cell.mainImage.image = UIImage(named: "restont.jpeg")
            }
            if let imagelogo = allResult[indexPath.row].logo{
                DispatchQueue.main.async {
                    if imagelogo == "http://www.elwalima.com/elwalima_beta/public//uploads/restaurants" {
                        cell.logoImage.image = UIImage(named: "restont.jpeg")
                    }else{
                        cell.logoImage.kf.indicatorType = .activity
                        cell.logoImage.kf.setImage(with: URL(string: imagelogo))
                    }
                }
            }else{
                cell.logoImage.image = UIImage(named: "restont.jpeg")
            }

            
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
    
    
    
    
}


extension searchResults : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320.0
    }
}

