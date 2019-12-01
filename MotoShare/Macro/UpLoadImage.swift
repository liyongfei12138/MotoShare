//
//  UpLoadImage.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/27.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import UPYUN

typealias UPLoadImgSuccessBlock = (Optional<Dictionary<AnyHashable, Any>>) -> ()
typealias UPLoadImgFailedBlock = () -> ()
class UpLoadImage: NSObject {

   
    
    static func upLoadImage(img:UIImage, bucketName:String? = "image-yunmo",fileName:String,success:UpLoaderSuccessBlock!,failure:UPLoadImgFailedBlock!){
        
        let upLoader = UpYunFormUploader()
        
        let imgData:Data = UIImage.pngData(img)() ?? Data()
        let saveKey = "motoicon/" + fileName + "motoshare.png"
    
        let YunName = "yunmo"
        let YunPassword = "shenmemima"
        
        upLoader.upload(withBucketName: bucketName, operator: YunName, password: YunPassword, fileData: imgData, fileName: fileName, saveKey: saveKey, otherParameters: nil, success: { (respone, info) in
            success(respone,info)
        }, failure: { (error, respond, info) in
            
            failure()
        }) { (count, counts) in
            
        }
        
        
    }
    
    
    
    
}
