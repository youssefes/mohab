//
//  sliderCell.swift
//  mohabProject
//
//  Created by youssef on 7/6/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class sliderCell: UICollectionViewCell {
    
    @IBOutlet weak var imageSlider: UIImageView!
    
    var image : UIImage!{
        didSet{
            imageSlider.image = image
        }
    }
}
