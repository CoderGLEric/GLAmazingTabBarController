//
//  AnimationTabBarController.swift
//  Personal
//
//  Created by 耿雷 on 16/4/22.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit

protocol RAMItemAnimationProtocol {
    func playAnimation(icon:UIImageView, textLabel:UILabel)
    func deselectAnimation(icon:UIImageView, textLabel:UILabel, defaultTextColor:UIColor)
    func selectedState(icon:UIImageView, textLabel:UILabel)
}

class RAMItemAnimation: NSObject, RAMItemAnimationProtocol {
    var duration:CGFloat = 0.6
    //字体被选颜色
    var textSelectedColor:UIColor = UIColor.redColor()
    var iconSelectedColor:UIColor?
    
    func playAnimation(icon: UIImageView, textLabel: UILabel) {
        
    }
    
    func deselectAnimation(icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor) {
        
    }
    
    func selectedState(icon: UIImageView, textLabel: UILabel) {
        
    }
}

class RAMBounceAnimation: RAMItemAnimation {
    override func playAnimation(icon: UIImageView, textLabel: UILabel) {
       playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
    }
    override func deselectAnimation(icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor) {
        textLabel.textColor = defaultTextColor
        if let iconImage = icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.Automatic)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
    func playBounceAnimation(icon:UIImageView) {
        //动画
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0,1.4,0.9,1.15,0.95,1.02,1.0]
        bounceAnimation.duration = NSTimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.addAnimation(bounceAnimation, forKey: "bounceAnimation")
        if let iconImage = icon.image {
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysOriginal)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
        
        
    }
}

class RAMAnimatedTabBarItem: UITabBarItem {
    var animation = RAMItemAnimation?()
    //字体默认颜色
    var textColor = UIColor.grayColor()
    func playAnimation(icon:UIImageView, textLabel:UILabel) {
        guard let animation = animation else {
            print("add animation in UITabBarItem")
            return
        }
        animation.playAnimation(icon, textLabel: textLabel)
    }
    
    func deselectAnimation(icon:UIImageView, textLabel:UILabel) {
        animation?.deselectAnimation(icon, textLabel: textLabel, defaultTextColor: textColor)
    }
    
    func selectedState(icon:UIImageView, textLabel:UILabel) {
        animation?.selectedState(icon, textLabel: textLabel)
    }
}

class AnimationTabBarController: UITabBarController {

    var iconsView :[(icon:UIImageView, textLabel: UILabel)] = []
    var iconsImageName:[String] = ["bottomNav-home","bottomNav-business","bottomNav-service","bottomNav-mine"]
    var iconsSelectedImageName:[String] = ["bottomNav-home-on","bottomNav-business-on","bottomNav-service-on","bottomNav-mine-on"]
    var shopCarIcon:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    deinit{
        
    }
    func createViewContainers() -> [String: UIView] {
        var containersDict = [String:UIView]()
        
        guard let customItems = tabBar.items as?[RAMAnimatedTabBarItem] else
        {
            return containersDict
        }
        
        for index in 0..<customItems.count{
            let viewContainer = createViewContainer(index)
            containersDict["container\(index)"] = viewContainer
        }
        
        return containersDict
    }
    
    func createViewContainer(index: Int) -> UIView {
        let viewWidth:CGFloat = SCREEN_WIDTH/CGFloat(tabBar.items!.count)
        let viewHeight:CGFloat = tabBar.bounds.size.height
        
        let viewContainer = UIView(frame: CGRectMake(viewWidth*CGFloat(index), 0, viewWidth, viewHeight))
        viewContainer.backgroundColor = UIColor.clearColor()
        viewContainer.userInteractionEnabled = true
        
        tabBar.addSubview(viewContainer)
        viewContainer.tag = index
        
        let tap = UITapGestureRecognizer(target: self, action: "tabBarClick:")
        viewContainer.addGestureRecognizer(tap)
        
        return viewContainer
    }
    
    func createCustomIcons(containers:[String:UIView]) {
        if let items = tabBar.items {
            for (index, item) in items.enumerate() {
                assert(item.image != nil, "add image icon in UITabBarItem")
                guard let container = containers["container\(index)"] else
                {
                    print("No container given")
                    continue
                }
                
                container.tag = index
                let imageW:CGFloat = 21
                let imageX:CGFloat = (SCREEN_WIDTH/CGFloat(items.count) - imageW)*0.5
                let imageY:CGFloat = 8
                let imageH:CGFloat = 21
                
                let icon = UIImageView(frame: CGRectMake(imageX, imageY, imageW, imageH))
                icon.image = item.image
                icon.tintColor = UIColor.clearColor()
                
                // text
                let textLabel = UILabel()
                textLabel.frame = CGRectMake(0, 32, SCREEN_WIDTH/CGFloat(items.count), 49-32)
                textLabel.text = item.title
                textLabel.backgroundColor = UIColor.clearColor()
                textLabel.font = UIFont.systemFontOfSize(10.0)
                textLabel.textAlignment = NSTextAlignment.Center
                textLabel.textColor = UIColor.grayColor()
                textLabel.translatesAutoresizingMaskIntoConstraints = false
                container.addSubview(icon)
                container.addSubview(textLabel)
                
                if let tabBarItem = tabBar.items {
                    let textLabelWidth = tabBar.frame.size.width/CGFloat(tabBarItem.count)
                    textLabel.bounds.size.width = textLabelWidth
                }
                
                let iconsAndLabels = (icon:icon, textLabel:textLabel)
                iconsView.append(iconsAndLabels)
                
                item.image = nil
                item.title = ""
                
                if index == 0 {
                    selectedIndex = 0
                    selectItem(0)
                }
            }
        }
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        setSelectIndex(from: selectedIndex, to: item.tag)
    }
    func selectItem(Index: Int) {
        let items = tabBar.items as! [RAMAnimatedTabBarItem]
        let selectIcon = iconsView[Index].icon
        selectIcon.image = UIImage(named: iconsSelectedImageName[Index])!
        items[Index].selectedState(selectIcon, textLabel:iconsView[Index].textLabel)
    }
    
    func setSelectIndex(from from:Int, to: Int) {
        selectedIndex = to
        let items = tabBar.items as! [RAMAnimatedTabBarItem]
        
        let fromIV = iconsView[from].icon
        fromIV.image = UIImage(named: iconsImageName[from])
        items[from].deselectAnimation(fromIV, textLabel: iconsView[from].textLabel)
        
        let toIV = iconsView[to].icon
        toIV.image = UIImage(named: iconsSelectedImageName[to])
        items[to].playAnimation(toIV, textLabel: iconsView[to].textLabel)
        
    }
    
}
