//
//  BaseViewController.swift
//  Personal
//
//  Created by 耿雷 on 16/4/21.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var backBtn: UIButton = {
        //设置返回按钮属性
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.setImage(UIImage(named: "nav_back_normal"), forState: .Normal)
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        backBtn.addTarget(self, action: #selector(BaseViewController.backBtnClick), forControlEvents: .TouchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        let btnW: CGFloat = SCREEN_WIDTH > 375.0 ? 50 : 44
        backBtn.frame = CGRectMake(0, 0, btnW, 40)

        return backBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.tabBarController?.navigationItem.leftBarButtonItem = nil
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        
    }
    
    func initLeftNavigationBackButton() {
        let barItem = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItem = barItem
    }
    
    func backBtnClick() {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    

}
