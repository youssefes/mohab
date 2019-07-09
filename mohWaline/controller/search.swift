//
//  search.swift
//  mohabProject
//
//  Created by youssef on 7/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class search: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate
{
    
    
    
    

    @IBOutlet weak var pickernumberOfGest: UIPickerView!
    @IBOutlet weak var dayNumber: UILabel!
    var allOffersData = [offerData]()
    var numberOfGuest = [0,50,100,150,200,250,300,350,400,450,500,600,650,700,800,900,100]
    var numberOfGuests : Int = 0
    
    @IBOutlet weak var myOrderBtn: UIButton!
    @IBOutlet weak var Done: UIButton!
    @IBOutlet weak var dataPickerDAte: UIDatePicker!
    @IBOutlet weak var manthAndYear: UILabel!
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var collectionVIewOffers: UICollectionView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var textSearch: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSearch.applyShadow()
        collectionVIewOffers.delegate = self
        collectionVIewOffers.dataSource = self
        pickernumberOfGest.delegate = self
        pickernumberOfGest.dataSource = self
        getOffers()
        
        
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        Done.isHidden = true
        dataPickerDAte.isHidden = true
        myOrderBtn.isHidden = false
        
        
    }
    @IBAction func showDateToChoose(_ sender: Any) {
        Done.isHidden = false
        dataPickerDAte.isHidden = false
        myOrderBtn.isHidden = true
        
    }
    
    @IBAction func myOrderBtton(_ sender: Any) {
    }
    
    @IBAction func showResult(_ sender: Any) {
        getResult()
    }
    
    
    func getOffers(){
        
        dataPickerDAte.addTarget(self, action: #selector(datePickerValueEnd), for: .valueChanged)
        
        
        
        API.getOffers(lan: "en") { (status, msg, offerDatare) in
            if status{
                if let message = msg{
                    print(message)
                    if let alloffer = offerDatare{
                        self.allOffersData = alloffer
                        DispatchQueue.main.async {
                            self.collectionVIewOffers.reloadData()
                        }
                        
                    }
                }
            }
        }
    }
    
    
    func getResult(){
        
        guard let name = textSearch.text,!name.isEmpty else{
            return
        }
        API.getResult(name: name, long: 31.4124321, lat: 31.4124312, len: "en") { (status, masg, result) in
            if status {
                if let massage = masg{
                    print(massage)
                    if let allResulet = result{
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "searchResult") as? searchResults{
                            vc.allResult =  allResulet
                            self.present(vc, animated: true, completion: nil)
                            
                        }else{
                            print("faild to get vcName")
                        }
                    }else{
                        print("empty data ")
                    }
                }
            }else{
                print("error in enternet")
            }
        }
    }
    
    
    
    @objc func datePickerValueEnd(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "d"
        dayNumber.text = dateFormatter.string(for: sender.date)
        dateFormatter.dateFormat = "EEE"
        dayName.text = dateFormatter.string(for: sender.date)
        dateFormatter.dateFormat = "MMM"
        let manth = dateFormatter.string(for: sender.date)
        
        dateFormatter.dateFormat = "yyyy"
        let Picking_Up_Date = dateFormatter.string(for: sender.date)!
        if let Manth = manth{
            
                manthAndYear.text = "\(Manth) \(Picking_Up_Date)"
            
        }
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        pickerView.subviews.forEach({
            $0.isHidden = $0.frame.height < 1.0
        })
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfGuest.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberOfGuest[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NumberOfGestForBooking = numberOfGuest[row]
    }
    
    
}

extension search : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allOffersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as? OffersCell{
            cell.viewContainer.applyShadow()
            if let image =  allOffersData[indexPath.row].image {
                cell.imageOffer.kf.indicatorType = .activity
                cell.imageOffer.kf.setImage(with: URL(string: image))
            }
            if let intro = allOffersData[indexPath.row].intro{
                cell.offerIntro.text = intro
            }
            
            if let title = allOffersData[indexPath.row].title{
                cell.offeritle.text = title
            }
            if let ball_id = allOffersData[indexPath.row].id{
                cell.ball_room_id = ball_id
            }
            
            return cell
            
        }else{
            return UICollectionViewCell()
        }
        
        
        
    }
    
    
}

extension search : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360.0
    }
    
}


