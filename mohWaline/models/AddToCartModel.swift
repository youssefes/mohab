//
//  AddToCartModel.swift
//  mohWaline
//
//  Created by youssef on 7/7/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
/*
"msg": "Data saved successfully",
"code": 1,
"data": {
    "user_id": 1,
    "item_id": "2",
    "quantity": "33",
    "size": "1",
    "updated_at": "2019-07-07 13:38:13",
    "created_at": "2019-07-07 13:38:13",
    "id": 64
 */

struct addtoCart : Codable {
    var code : Int?
    var msg : String?
    var data : AddCart?
}

struct AddCart : Codable{
    var item_id : Int?
    var user_id : Int?
    var quantity : String?
    var id : Int?
    var created_at : String?
    var size : String?
    var updated_at : String?
    var deleted_at : String?
    
}

struct addTowishlist : Codable {
    var code : Int?
    var msg : String?
    var data : wishlistReturn?
}

struct wishlistReturn: Codable {
    var id : Int?
    var user_id : Int?
    var updated_at : String?
    var created_at : String?
    var deleted_at : String?
    
    
    
}
