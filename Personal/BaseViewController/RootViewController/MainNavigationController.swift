//
//  MainNavigationController.swift
//  Personal
//
//  Created by 耿雷 on 16/4/21.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit



class MainNavigationController: UINavigationController,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationTitleAttribute : NSDictionary = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        self.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject] as? [String :AnyObject]
//        self.navigationBar.setBackgroundImage(UIImage(named:"navi_BG"), forBarMetrics: .Default)
        interactivePopGestureRecognizer!.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.enabled = true
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.hidesBackButton = true
        if childViewControllers.count > 0 {
            
            UINavigationBar.appearance().backItem?.hidesBackButton = false
            viewController.hidesBottomBarWhenPushed = true
            self.interactivePopGestureRecognizer?.enabled = false
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func backBtnClick() {
        popViewControllerAnimated(true)
    }
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.viewControllers.count<1 {
            return false
        }
        
        return true
    }
    
}
