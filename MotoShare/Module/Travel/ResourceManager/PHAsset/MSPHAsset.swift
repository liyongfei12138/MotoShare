//
//  MSPHAsset.swift
//  MotoShare
//
//  Created by mac on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSPHAsset: NSObject {
    
    /// 相册资源
    var asset: PHAsset!
    
    /// 是否选中状态
    var isSelected: Bool = false
    
    /// 选中的编号
    var selectedNo: Int?
    
    /// 是否可选（选择数量到最大选择数后，其他图片不可选）
    var isOptional: Bool = true
}
