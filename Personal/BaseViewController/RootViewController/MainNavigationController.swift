//
//  MainNavigationController.swift
//  Personal
//
//  Created by 耿雷 on 16/4/21.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(CommenTool.createImageWithColorAndSize(UIColor.greenColor(), size: CGSizeMake(SCREEN_WIDTH, 64.0)), forBarMetrics: .Default)
        interactivePopGestureRecognizer!.delegate = nil
        
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    
}
