//
//  offerModel.swift
//  mohWaline
//
//  Created by youssef on 7/8/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation
/*
 "id": 2,
 "title": null,
 "image": "http://www.elwalima.com/elwalima_beta/public//uploads/ballroom/90294_1559173011.jpg",
 "video": null,
 "intro": null,
 "details": null,
 "has_offer": 1,
 "offer_start_date_time": "2019-05-29 00:00:00",
 "offer_end_date_time": "2019-05-31 00:00:00",
 "gallery": null,
 "long": "32123",
 "lat": "312312",
 "price": "12",
 "no_seats": 32,
 "area_id": 1
 
 */

struct offer : Codable{
    var msg : String?
    var code : Int?
    var data : [offerData]?
}

struct offerData : Codable {
    var id : Int?
    var title : String?
    var long : String?
    var lat : String?
    var offer_start_date_time  : String?
    var offer_end_date_time : String?
    var image : String?
    var video : String?
    var gallery :String?
    var area_id : Int?
    var intro : String?
    var details : String?
    var has_offer : Int?
    var no_seats : Int?
    var price : String?
}




/*
 "user_id": "1",
 "no_guest": "200",
 "ball_room_id": "1",
 "booking_date": "2019-07-08",
 "updated_at": "2019-07-08 19:44:44",
 "created_at": "2019-07-08 19:44:44",
 "id": 11
 */

struct Bokking : Codable{
    var msg : String?
    var code : Int?
    var data : bookingData?
}

struct bookingData : Codable{
    var user_id : String?
    var no_guest : String?
    var ball_room_id : String?
    var booking_date : String?
    var updated_at : String?
    var created_at : String?
    var id : Int?
    
    
    
    
    
}
