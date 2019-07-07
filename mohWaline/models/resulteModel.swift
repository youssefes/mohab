//
//  resulteModel.swift
//  mohabProject
//
//  Created by youssef on 7/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation

struct results : Codable{
    var msg : String?
    var data : [resultdata]?
}

struct resultdata : Codable {
    var id : Int?
    var name : String?
    var address : String?
    var long : Int?
    var lat : Int?
    var opened : Bool?
    var logo  : String?
    var image : String?
    var video : String?
    var gallery :String?
    var branch_id : Int?
    var area_id : Int?
    var email : String?
    var review : Int?
    var foodTypes : [String]?
}

/*

"msg": "Data has  retrieved successfully",
"code": 1,
"data": [
{
"id": 1,
"name": "sabahi",
"address": null,
"long": 31,
"lat": 31,
"opened": false,
"logo": "http:\/\/www.elwalima.com\/elwalima_beta\/public\/\/uploads\/restaurantlogo",
"image": "http:\/\/www.elwalima.com\/elwalima_beta\/public\/\/uploads\/restaurants\/16686_1559308528.jpeg",
"video": "youtube.com",
"gallery": null,
"branch_id": 3,
"area_id": null,
"email": null,
"review": 5,
"foodTypes": [
"lebanies",
"Egyptian"
]
}
]
*/
