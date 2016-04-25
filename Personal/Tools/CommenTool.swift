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
}
