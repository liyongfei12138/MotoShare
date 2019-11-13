//
//  HBSArchiveManager.swift
//  HBS
//
//  Created by mac on 2019/10/22.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

class HBSArchiveManager: NSObject {
    
    /// 对象存储
    /// - Parameter object: 对象
    /// - Parameter file: 路径
    class func hbs_archive<T:Codable>(object: [T]?, path: String) -> Bool {
        
        let data = try? PropertyListEncoder().encode(object)
        let result = NSKeyedArchiver.archiveRootObject(data ?? (T).self, toFile: path)
        return result
    }
    
    /// 本地对象取出
    /// - Parameter product: 类型
    /// - Parameter path: 路径
    class func hbs_unarchive<T:Codable>(product: T.Type, path: String) -> [T] {
        
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? Data else {
            
            return []
        }
        
        do {
            
            let object = try PropertyListDecoder().decode(Array<T>.self, from: data)
            return object
        }catch {
            
            return []
        }
    }
}
