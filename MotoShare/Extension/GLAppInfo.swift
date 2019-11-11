//
//  GLAppInfo.swift
//  GeneralProject
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import Foundation

/// app信息扩展类
public class GLAppInfo {
    
    /// 获得info.plist的字典
    ///
    /// - Returns: info.plist的字典数据
    public class func gl_getInfoDictionary() -> Dictionary<String, Any>? {
        
        var infoDict: Dictionary<String, Any>? = Bundle.main.infoDictionary
        
        if infoDict == nil || infoDict!.count <= 0 {
            infoDict = Bundle.main.localizedInfoDictionary
        }
        
        if infoDict == nil || infoDict!.count <= 0 {
            let infoPath: String? = Bundle.main.path(forResource: "Info", ofType: "plist")
            
            if infoPath != nil {
                
                let localDict: NSDictionary? = NSDictionary.init(contentsOfFile: infoPath!)
                if localDict != nil && localDict!.count > 0 {
                    infoDict = localDict as? [String: Any]
                }
            }
        }
        return infoDict
    }
    
    /// 获得app的名称
    ///
    /// - Returns: app的名称
    public class func gl_appName() -> String? {
        
        let infoDict: [String : Any]? = self.gl_getInfoDictionary()
        
        var appName: String?
        
        if infoDict != nil {
            appName = infoDict?["CFBundleDisplayName"] as? String
        }
        
        return appName
    }
    
    /// 获得app的编译版本号
    ///
    /// - Returns: 编译版本号
    public class func gl_appBuildVersion() -> String? {
        
        let infoDict: [String : Any]? = self.gl_getInfoDictionary()
        
        var buildVersion: String?
        
        if infoDict != nil {
            buildVersion = infoDict?["CFBundleVersion"] as? String
        }
        return buildVersion
    }
    
    /// 获得当前app的显示版本
    ///
    /// - Returns: 版本号
    public class func gl_appVersion() -> String? {
        let infoDict: [String : Any]? = self.gl_getInfoDictionary()
        
        var version: String?
        
        if infoDict != nil {
            version = infoDict?["CFBundleShortVersionString"] as? String
        }
        return version
    }
}
