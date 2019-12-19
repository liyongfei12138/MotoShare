//
//  HTTPSManager.swift
//  MotoShare
//
//  Created by liyongfi on 2019/12/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

import Alamofire

class HTTPSManager: NSObject {
    
   func setAlamofireHttps() {
        
        SessionManager.default.delegate.sessionDidReceiveChallenge = { (session: URLSession, challenge: URLAuthenticationChallenge) in
            
            let method = challenge.protectionSpace.authenticationMethod
            
            if method == NSURLAuthenticationMethodServerTrust {
                
                //验证服务器，直接信任或者验证证书二选一，推荐验证证书，更安全
                return HTTPSManager.trustServer(challenge: challenge)
//                return HTTPSManager.trustServer(challenge: challenge)
                
            } else {
                
                //其他情况，不通过验证
                return (.cancelAuthenticationChallenge, nil)
                
            }
            
        }
        
    }
    
    //不做任何验证，直接信任服务器
    static private func trustServer(challenge: URLAuthenticationChallenge) -> (URLSession.AuthChallengeDisposition, URLCredential?) {
        
        let disposition = URLSession.AuthChallengeDisposition.useCredential
        let credential = URLCredential.init(trust: challenge.protectionSpace.serverTrust!)
        return (disposition, credential)
        
    }
    
}
