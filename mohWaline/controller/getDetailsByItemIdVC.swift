//
//  getDetailsByItemIdVCViewController.swift
//  mohabProject
//
//  Created by youssef on 7/6/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class getDetailsByItemIdVC: UIViewController {

    
    var currentIndex = 0
    @IBOutlet weak var collectionViewImages: UICollectionView!
    var images = [
        UIImage(named: "1.jpg"),
        UIImage(named: "2.jpg"),
        UIImage(named: "3.jpg")
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewImages.delegate = self
        collectionViewImages.dataSource = self
        getDetails()

        // Do any additional setup after loading the view.
    }
    
    
    func getDetails(){
    
        API.getDetailsByItemId(item_id: 1, len: "ar") { (status, msg, datareturn) in
            if status{
                if let data = datareturn{
                    print(data)
                }
            }
        
        }
    }
    
    func scrollToSecond(){
        
        let scrollPosition = (currentIndex < images.count - 1 ) ? currentIndex + 1 : 0
        collectionViewImages.scrollToItem(at: IndexPath(item: scrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }

}

extension getDetailsByItemIdVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as? sliderCell{
            cell.image = images[indexPath.row]
            return cell
        }else{
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x/collectionViewImages.frame.size.width)
    }

    
    
}
