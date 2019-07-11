//
//  OrderDetailsModel.swift
//  mohWaline
//
//  Created by youssef on 7/11/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
/*
"id": 16,
"user_id": 1,
"restaurant_id": 1,
"total": "912",
"total_after_promocode": null,
"promocode_id": null,
"create_date_time": "2019-07-07 20:55:47",
"payment_transaction_id": null,
"payment_token": null,
"payment_type": null,
"status": "pending",
"delivery_time": null,
"delivery_type": null,
"created_at": "2019-07-07 20:55:47",
"updated_at": "2019-07-07 20:55:47",
"deleted_at": null
*/
struct order : Codable{
    var msg : String?
    var code : Int?
    var data : [orderData]?
}

struct orderData:Codable {
    var id : Int?
    var user_id : Int?
    var restaurant_id : Int?
    var status : String?
    var total : String?
    var total_after_promocode : String?
    var promocode_id : Int?
    var create_date_time : String?
    var payment_transaction_id : Int?
    var payment_token : String?
    var payment_type : String?
    var delivery_time : String?
    var delivery_type : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
}
