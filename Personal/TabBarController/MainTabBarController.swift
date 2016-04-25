//
//  MainTabBarController.swift
//  Personal
//
//  Created by 耿雷 on 16/4/21.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit

class MainTabBarController: AnimationTabBarController,UITabBarControllerDelegate {
    
    private var firstLoadMainTabBarController: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        buildMainTabBarChildViewController()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if firstLoadMainTabBarController {
            let containers = createViewContainers()
            createCustomIcons(containers)
            firstLoadMainTabBarController = false
        }
        
    }
    
    private func buildMainTabBarChildViewController (){
        tabBarControllerAddChildViewController(FirstHomeViewController(), title: "首页", imageName: "bottomNav-home", selectedImageName: "bottomNav-home-on", tag: 0)
        tabBarControllerAddChildViewController(SecondHomeViewController(), title: "商机", imageName: "bottomNav-business", selectedImageName: "bottomNav-business-on", tag: 1)
        tabBarControllerAddChildViewController(ThirdHomeViewController(), title: "服务", imageName: "bottomNav-service", selectedImageName: "bottomNav-service-on", tag:2)
        tabBarControllerAddChildViewController(ForthHomeViewController(), title: "我的", imageName: "bottomNav-mine", selectedImageName: "bottomNav-mine-on", tag: 3)
    }
    
    private func tabBarControllerAddChildViewController(childView: UIViewController,title:String, imageName:String, selectedImageName:String,tag:Int){
        let vcItem = RAMAnimatedTabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vcItem.tag = tag
        vcItem.animation = RAMBounceAnimation()
        childView.tabBarItem = vcItem
        
        let navigationVC = MainNavigationController(rootViewController: childView)
        addChildViewController(navigationVC)
        
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        
        return true
    }

}
