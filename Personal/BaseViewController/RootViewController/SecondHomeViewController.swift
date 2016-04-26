//
//  SecondHomeViewController.swift
//  Personal
//
//  Created by 耿雷 on 16/4/21.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit
import Alamofire

@objc(SecondHomeViewController)
class SecondHomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor();
        // Do any additional setup after loading the view.
        getInfoFromServer()
    }

    func getInfoFromServer(){
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo":"bar"]).responseJSON { (response) in
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result)
            if let JSON = response.result.value {
                print("JSON\(JSON)")
            }
        }
    }
}
