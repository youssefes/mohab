//
//  getDetailesByItemId.swift
//  mohabProject
//
//  Created by youssef on 7/6/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation



struct getDetailsByItem:Codable {
    var msg: String?
    var code : Int?
    var data : dataDetails?
}

struct dataDetails: Codable {
    var id : Int?
    var category_id : Int?
    var name : String?
    var image : String?
    var gallery : String?
    var intro : String?
    var details : String?
    var price : String?
    var restaurant_id: Int?
    var small_size_price : String?
    var meduim_size_price : String?
    var larg_size_price : String?
    var video : String?
    var cooking_time : Int?
    var ingredients : String?
}
/*
"msg": "تم ارجاع البيانات بنجاح",
"code": 1,
"data": {
    "id": 3,
    "category_id": null,
    "name": null,
    "image": "http:\/\/www.elwalima.com\/elwalima_beta\/public\/\/uploads\/items\/69619_1562104429.jpeg",
    "gallery": null,
    "intro": null,
    "details": null,
    "price": "50",
    "restaurant_id": 3,
    "small_size_price": "21",
    "meduim_size_price": null,
    "larg_size_price": "41",
    "video": "https:\/\/www.youtube.com\/watch?v=XvtrASgfek4",
    "cooking_time": 21,
    "ingredients": null
}
 
 */
