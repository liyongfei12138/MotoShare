//
//  MSResourceManagerHeader.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/30.
//  Copyright © 2019 Bingo. All rights reserved.
//

import Foundation

enum ChoiceType {
    case all    // 相册、拍照、视频
    case image  // 相册、拍照
}

@objc protocol MSResourceManagerViewControllerDelegate: NSObjectProtocol {
    
    /// 选择视频完成后
    /// - Parameter asset: 视频资源
    @objc optional func videoChoiceFinish(asset: MSPHAsset)
    
    /// 选择图片完成后
    /// - Parameter assets: 图片资源组
    @objc optional func imageChoiceFinish(assets: [MSPHAsset])
}
