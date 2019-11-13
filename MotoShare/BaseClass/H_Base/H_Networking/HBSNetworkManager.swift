//
//  HBSNetworkManager.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import Foundation
import Alamofire

/// 请求失败回调
typealias HBSNewworkErrorBlock = (HBSNetworkError) -> ()

class HBSNetworkManager {
    
    /// 网络请求json
    /// - Parameter url: 链接
    /// - Parameter method: 请求方式
    /// - Parameter parameters: 参数
    /// - Parameter encoding: 编码方式
    /// - Parameter headers: 请求头
    /// - Parameter success: 成功回调
    /// - Parameter failure: 失败回调
    class func hbs_request(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, success: @escaping(_ data: Any) -> (), failure: @escaping(_ error: HBSNetworkError) -> ()) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            
            if let json = response.result.value {
                
                success(json)
                
            }else {
                
                if let httpResponse = response.response {
                    
                    failure(HBSNetworkError(code: httpResponse.statusCode, message: "不在状态啦..."))
              
                }else {
                    
                    failure(HBSNetworkError(code: -1004, message: "网络出现了问题，轻触重试"))

                }
            }
        }
    }
    
    /// 网络请求data
    /// - Parameter url: 链接
    /// - Parameter method: 请求方式
    /// - Parameter parameters: 参数
    /// - Parameter encoding: 编码方式
    /// - Parameter headers: 请求头
    /// - Parameter success: 成功回调
    /// - Parameter failure: 失败回调
    class func hbs_request_data(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, success: @escaping(_ data: Any) -> (), failure: @escaping(_ error: HBSNetworkError) -> ()) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseData { (response) in
            
            if let json = response.result.value {
                
                success(json)
                
            }else {
                
                if let httpResponse = response.response {
                    
                    failure(HBSNetworkError(code: httpResponse.statusCode, message: "不在状态啦..."))
              
                }else {
                    
                    failure(HBSNetworkError(code: -1004, message: "网络出现了问题，轻触重试"))

                }
            }
        }
    }
    
    /// 图片上传
    /// - Parameter url: 链接
    /// - Parameter method: 请求方式
    /// - Parameter parameters: 参数
    /// - Parameter encoding: 编码方式
    /// - Parameter headers: 请求头
    /// - Parameter image: 图片
    /// - Parameter fileName: 文件名称
    /// - Parameter success: 成功回调
    /// - Parameter failure: 失败回调
    class func hbs_upload(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, image: UIImage, fileName: String, success: @escaping(_ data: Any) -> (), failure: @escaping(_ error: HBSNetworkError) -> ()) {
                    
        Alamofire.upload(multipartFormData: { (multipartFormData) in

            let data = image.jpegData(compressionQuality: 0.5)
            let fileName = "file"
            
            multipartFormData.append(data!, withName: "file", fileName: fileName, mimeType: "image/png")

            if parameters != nil {
                
                for (key, value) in parameters! {
                   
                    let valueString = value as! String
                    multipartFormData.append(valueString.data(using: String.Encoding.utf8)!, withName: key)
                }
            }
            
        }, to: url, method: method, headers: headers) { (encodingResult) in
            
            switch encodingResult {
                
            case .success(let upload, _, _):
                
                upload.responseJSON { (response) in
                    if let json = response.result.value {
                       
                        success(json)
                   
                    }else {
                   
                        failure(HBSNetworkError(code: -1004, message: "网络出现了问题，轻触重试"))
                    }
                }
                break
                
            case .failure(let error): break
            

            failure(HBSNetworkError(code: -1004, message: "网络出现了问题，轻触重试"))
            }
        }
    }
}
