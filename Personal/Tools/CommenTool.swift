//
//  CommenTool.swift
//  Personal
//
//  Created by 耿雷 on 16/4/21.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit

class CommenTool: NSObject {
    class func getImgView(imgName:NSString)->UIImage {
        
        var image : UIImage = UIImage(named: imgName as String)!
        image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        
        return image
    }
    
    class func createImageWithColorAndSize(color:UIColor,size:CGSize)->UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
}
