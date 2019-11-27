//
//  SettingViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    
    
    lazy var listView: MeSettingTableView = {
           let listView = MeSettingTableView()
           listView.settingDataSourse = self
           return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "设置"
        
        self.view.addSubview(self.listView)
        configLayout()
    }
    func configLayout()  {
        self.listView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }


}


extension SettingViewController:MeSettingViewDelegate{
    func meSettingListViewDidType(type: SettingRowType) {
        switch type {
        case .about:
            let aboutVC = AboutViewController()
            self.navigationController?.pushViewController(aboutVC)
            
            break
        case .contact:
            let contactVc = ContactViewController()
            self.navigationController?.pushViewController(contactVc)
        
        break
        case .logout:
            UserManager.logout()
            UserManager.changeInfo()
            self.navigationController?.popViewController()
            
        break
            
        default:
            break
        }
    }
    
    func meSettingListViewTitleArray() -> Array<Array<SetBaseModel>> {
        return MeModel.getSettingTitleArray()
        
    }
    

}
