//
//  MSUIImageExtension.swift
//  MotoShare
//
//  Created by houhanglei on 2019/12/1.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

extension UIImage {
    
    func clipImage(rect: CGRect) -> UIImage {
        
        let sourceImageRef = self.ciImage!
        
        let newImageRef = sourceImageRef.cropped(to: rect)
        let image = UIImage.init(ciImage: newImageRef)
        
        return image
    }
}
