//
//  SettingViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import CDAlertView
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
            
            logout()
            
            
            
        break
            
        default:
            break
        }
    }
    
    func logout()  {
        let alert = CDAlertView(title: "退出登录", message: "点击确定退出登录", type: .warning)
        let doneAction = CDAlertViewAction(title:  "确定", textColor: UIColor.gl_hex(hex: 0x999999)) { (action) -> Bool in
            UserManager.logout()
            UserManager.changeInfo()
            self.navigationController?.popViewController()
            
            return true
        }
        
        alert.add(action: doneAction)
        
        let nevermindAction = CDAlertViewAction(title: "取消", textColor: ColorTheme)
        alert.add(action: nevermindAction)
        alert.show()
    }
    
    func meSettingListViewTitleArray() -> Array<Array<SetBaseModel>> {
        return MeModel.getSettingTitleArray()
        
    }
    

}
