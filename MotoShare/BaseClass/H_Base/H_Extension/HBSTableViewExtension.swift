//
//  HBSTableViewExtension.swift
//  HBS
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// 刷新某个section
    /// - Parameter section: section
    func hbs_reloadSection(section: Int) {
        
        UIView.performWithoutAnimation {
            
            self.reloadSections(IndexSet(integer: section), with: .none)
        }
    }
    
}
