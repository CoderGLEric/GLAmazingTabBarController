//
//  FirstHomeViewController.swift
//  Personal
//
//  Created by 耿雷 on 16/4/21.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit
@objc(FirstHomeViewController)
class FirstHomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
    
    private func layoutViews(){
        let btn = UIButton(type: .System)
        btn.frame = CGRectMake(100, 100, 100, 100)
        btn.setTitle("测试", forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(FirstHomeViewController.click), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func click() {
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
