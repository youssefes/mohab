
//
//  APIFunctions.swift
//  mohabProject
//
//  Created by youssef on 7/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
import Alamofire

class API{
    class func getResult(name: String, long : Double ,lat : Double, len : String, complation: @escaping(_ status: Bool, _ masg: String?, _ result: [resultdata]?)->Void){
        
        let Url = "http://www.elwalima.com/elwalima_beta/api/searchrestaurants?name=\(name)&long=\(long)&lat=\(lat)&lang=\(lat)"
        
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (respond) in
            do{
                let result = try JSONDecoder().decode(results.self, from: respond.data!)
               
                let datares = result.data
                print(datares)
                complation(true,result.msg,datares)
            }
            catch{
                print("error")
                complation(false,nil,nil)
            }
        }
        
    }
    
    
    class func getDetailsByItemId(item_id: Int, len : String, complation : @escaping (_ status : Bool, _ msg : String?, _ details : dataDetails? )->Void){
        
        let Url = "http://www.elwalima.com/elwalima_beta/api/getItemDetails?item_id=\(item_id)&lang=\(len)"
        
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (respond) in
            do{
                let result = try JSONDecoder().decode(getDetailsByItem.self, from: respond.data!)
               
                let datares = result.data
                
                complation(true,result.msg,datares)
            }
            catch{
                print("error")
                complation(false,nil,nil)
            }
        }
    }
    
    
    class func addToCart(ItemId : Int , lan : String , token :String, size : Int, quantity: Int, complation : @escaping (_ status : Bool, _ msg : String?, _ dataReturn : AddCart?)->Void){
        
        let Url = "http://www.elwalima.com/elwalima_beta/api/addtocart?token=\(token)&item_id=\(ItemId)&quantity=\(quantity)&size=\(size)&lang=\(lan)"
        
        
        Alamofire.request(Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (respond) in
            do{
                
                let result = try JSONDecoder().decode(addtoCart.self, from: respond.data!)
                
                let datares = result.data
                if let msg = result.msg {
                   complation(true,msg, datares)
                }else{
                    complation(false,nil,nil)
                }
                
            }
            catch{
                print(error.localizedDescription)
                complation(false,nil,nil)
            }
        }
        
    }
}
