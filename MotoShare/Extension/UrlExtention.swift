//
//  UrlExtention.swift
//  Pretty
//
//  Created by Bingo on 2019/10/14.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import Foundation


extension URL{
    
    static func initPercent(string:String) -> URL
    {
        let urlwithPercentEscapes = string.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        let url = URL.init(string: urlwithPercentEscapes!)
        return url!
    }
}
