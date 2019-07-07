//
//  getDetailsByItemIdVCViewController.swift
//  mohabProject
//
//  Created by youssef on 7/6/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos
import TinyConstraints

class getDetailsByItemIdVC: UIViewController {
    
    
    var data = dataDetails()
    var restName = "cusine name"
    var revirew = 3
    
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6Ly93d3cuZWx3YWxpbWEuY29tL2Vsd2FsaW1hX2JldGEvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNTYyNTA2NjU2LCJleHAiOjM2MDAwMDAwMDE1NjI1MDY2NTYsIm5iZiI6MTU2MjUwNjY1NiwianRpIjoiakdKUGhiUUJUQlJNbk1jMyJ9.jzo1OhFXfrWLdiq6Bbo2XIzT-6FCvMEXEciJx_gP_gI"
    
    func cosmonView (retaing : Double ) -> CosmosView {
        var cosmosView : CosmosView{
            let view = CosmosView()
            view.settings.updateOnTouch = false
            view.rating = retaing
            return view
        }
        return cosmosView
    }
    
    @IBOutlet weak var smallbtn: UIButton!
    
    @IBOutlet weak var Bigbtn: UIButton!
    @IBOutlet weak var meduimbtn: UIButton!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var ViewRating: UIView!
    @IBOutlet weak var imageNAme: UIImageView!
    @IBOutlet weak var lblcusineNmae: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblDefination: UILabel!
    
    var currentIndex = 0
    @IBOutlet weak var collectionViewImages: UICollectionView!
    var images = [
        UIImage(named: "1.jpg"),
        UIImage(named: "2.jpg"),
        UIImage(named: "3.jpg")
    
    ]
    
    
    @IBOutlet weak var pags: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        pags.numberOfPages = images.count
        collectionViewImages.delegate = self
        collectionViewImages.dataSource = self
        getDetails()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bigBtn(_ sender: Any) {
        if let Big = data.larg_size_price{
            self.price.text = "OMR \(Big)"
            self.smallbtn.backgroundColor = #colorLiteral(red: 0.9110197425, green: 0.3845902681, blue: 0.5056612492, alpha: 0.4630583781)
            self.Bigbtn.backgroundColor = #colorLiteral(red: 0.9435308576, green: 0.3504853845, blue: 0.4427298307, alpha: 1)
            self.meduimbtn.backgroundColor = #colorLiteral(red: 0.9110197425, green: 0.3845902681, blue: 0.5056612492, alpha: 0.4630583781)
            self.Bigbtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            self.smallbtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.meduimbtn.setTitleColor(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), for: .normal)
        }
        

    }
    @IBAction func meduimBtn(_ sender: Any) {
        if let medPrice = data.meduim_size_price{
            self.price.text = "OMR \(medPrice)"
            self.smallbtn.backgroundColor = #colorLiteral(red: 0.9110197425, green: 0.3845902681, blue: 0.5056612492, alpha: 0.4630583781)
            self.Bigbtn.backgroundColor = #colorLiteral(red: 0.9110197425, green: 0.3845902681, blue: 0.5056612492, alpha: 0.4630583781)
            self.meduimbtn.backgroundColor = #colorLiteral(red: 0.9435308576, green: 0.3504853845, blue: 0.4427298307, alpha: 1)
            self.meduimbtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            self.Bigbtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.smallbtn.setTitleColor(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), for: .normal)
        }
        
    }
    
    @IBAction func smallBtn(_ sender: Any) {
        if let small = data.small_size_price{
            self.price.text = "OMR \(small )"
            self.smallbtn.backgroundColor = #colorLiteral(red: 0.9435308576, green: 0.3504853845, blue: 0.4427298307, alpha: 1)
            self.Bigbtn.backgroundColor = #colorLiteral(red: 0.9110197425, green: 0.3845902681, blue: 0.5056612492, alpha: 0.4630583781)
            self.meduimbtn.backgroundColor = #colorLiteral(red: 0.9110197425, green: 0.3845902681, blue: 0.5056612492, alpha: 0.4630583781)
            self.smallbtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            self.Bigbtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            self.meduimbtn.setTitleColor(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func addToCard(_ sender: Any) {
        API.addToCart(ItemId: 1, lan: "en", token: token, size: 1, quantity: 43) { (status, msg, returnData) in
            if status{
                if let massage = msg{
                    print(massage)
                    if let dataRE = returnData{
                        print(dataRE)
                    }
                }
            }
        }
    }
    
    @IBAction func twBtn(_ sender: Any) {
    }
    @IBAction func faceBtn(_ sender: Any) {
    }
    
    @IBAction func wishlistBtn(_ sender: Any) {
        API.AddToWishlist(ItemId: 20, lan: "en", token: token) { (status, msg, wishlistReturndata) in
            if status{
                if let message = msg{
                    print(message)
                    if let data = wishlistReturndata{
                        print(data)
                    }
                }
            }
        }
    }
    
    
    func getDetails(){
    
        API.getDetailsByItemId(item_id: 2, len: "ar") { (status, msg, datareturn) in
            if status{
                if let alldata = datareturn{
                    self.data = alldata
                    if let name = self.data.name{
                        self.lblItemName.text = name
                    }
                    
                    if let image = self.data.image{
                        
                        DispatchQueue.main.async {
                            self.imageNAme.kf.indicatorType = .activity
                            self.imageNAme.kf.setImage(with: URL(string: image))
                        }
                        
                    }
                    if let photoes = self.data.gallery{
                       
                    }
                    
                    if let smallprice = self.data.small_size_price {
                        self.price.text = "OMR \(smallprice)"
                        self.smallbtn.backgroundColor = #colorLiteral(red: 0.9435308576, green: 0.3504853845, blue: 0.4427298307, alpha: 1)
                        self.smallbtn.isHidden = false
                        self.smallbtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
                    }
                    if self.data.meduim_size_price != nil {
                        self.meduimbtn.isHidden = false
                    }
                    
                    if self.data.larg_size_price != nil {
                        self.Bigbtn.isHidden = false
                    }
                    
                    
                    if let intro = self.data.intro{
                        self.lblDefination.text = intro
                    }
                    let view = self.cosmonView(retaing: Double(self.revirew))
                    self.ViewRating.addSubview(view)
                    view.leadingToSuperview()
                    
                    
                    self.lblcusineNmae.text = self.restName
                }
            }
        
        }
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
        pags.currentPage = currentIndex
    }

    
    
}
