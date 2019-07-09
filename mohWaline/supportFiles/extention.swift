//
//  extention.swift
//  mohWaline
//
//  Created by youssef on 7/7/19.
//  Copyright © 2019 youssef. All rights reserved.
//
import  UIKit
import Foundation

var NumberOfGestForBooking = 0
extension UIView{
    @IBInspectable var borderwidth : CGFloat {
        
        set(newvalue){
            
            layer.borderWidth = newvalue
            
        }
        get{
            
            return layer.borderWidth
            
        }
        
    }
    
    
    @IBInspectable var bordercolor : UIColor {
        
        
        set(newvalue){
            
            
            layer.borderColor = newvalue.cgColor
        }
        get {
            
            return UIColor.black
        }
        
        
    }
    @IBInspectable var corner : CGFloat {
        
        set(val){
            
            layer.cornerRadius = val
            
        }
        get {
            
            return layer.cornerRadius
            
        }
        
    }
    
    
    func applyShadow() {
        self.layer.shadowOpacity = 0.7
        self.layer.cornerRadius = 25.0
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 1, height: 4)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        self.clipsToBounds = false
    }

}



