//
//  search.swift
//  mohabProject
//
//  Created by youssef on 7/4/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class search: UIViewController {

    @IBOutlet weak var textSearch: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func showResult(_ sender: Any) {
        getResult()
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

}


