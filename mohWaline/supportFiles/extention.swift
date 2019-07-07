//
//  extention.swift
//  mohWaline
//
//  Created by youssef on 7/7/19.
//  Copyright © 2019 youssef. All rights reserved.
//
import  UIKit
import Foundation


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

}
