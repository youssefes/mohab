//
//  OffersCell.swift
//  mohWaline
//
//  Created by youssef on 7/8/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class OffersCell: UICollectionViewCell {
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6Ly93d3cuZWx3YWxpbWEuY29tL2Vsd2FsaW1hX2JldGEvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTYyNTA2NjU2LCJleHAiOjM2MDAwMDAwMDE1NjI1MDY2NTYsIm5iZiI6MTU2MjUwNjY1NiwianRpIjoiakdKUGhiUUJUQlJNbk1jMyJ9.jzo1OhFXfrWLdiq6Bbo2XIzT-6FCvMEXEciJx_gP_gI"
    var id = 0
    var ball_room_id : Int!{
        didSet{
            id = ball_room_id
        }
    }
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imageOffer: UIImageView!
    @IBOutlet weak var offeritle: UILabel!
    
    @IBAction func booking(_ sender: Any) {
        print(id)
        API.Booking(user_id: 1, lan: "en", token: token, ball_room_id: id, no_guest: NumberOfGestForBooking) { (status, msg, bookingDataRe) in
            if status{
                if let message = msg{
                    print(message)
                    if let BookingDon = bookingDataRe{
                        print(BookingDon)
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var offerIntro: UILabel!
    
}
