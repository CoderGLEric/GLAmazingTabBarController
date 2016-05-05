//
//  ShareInstance.swift
//  Personal
//
//  Created by 耿雷 on 16/4/26.
//  Copyright © 2016年 coderGL. All rights reserved.
//

import UIKit

class ShareInstance: NSObject {
    internal static let defaultShare: ShareInstance = {
        return ShareInstance()
    }()
    private override init() {
        
    }
}
