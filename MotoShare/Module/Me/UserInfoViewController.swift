//
//  UserInfoViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/26.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import JXPhotoBrowser
class UserInfoViewController: BaseViewController {

    private lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .grouped)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorTableViewBG
        listView.separatorStyle = .none
        listView.bounces = false
        return listView
    }()

    lazy var dataArr: [[UserInfoBaseModel]] = {
        let dataArr = MeModel.getUserInfoListData()
        return dataArr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "个人信息"
        self.view.backgroundColor = ColorTableViewBG
        
        self.view.addSubview(self.listView)
        configLayout()
    }
    func configLayout()  {
        self.listView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    private func selectHeadImage(){
        
   
    }


}

extension UserInfoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return self.dataArr[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.dataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.dataArr[indexPath.section][indexPath.row]
        let title =  model.title ?? ""
        let type =  model.type
        let detail = model.detail ?? ""
        
        if type == .icon{
            let cell:UserInfoIconTableViewCell = UserInfoIconTableViewCell.reusableCell(tableView: tableView) as! UserInfoIconTableViewCell
            cell.configData(title: title, detail: detail)
            return cell
        }
        else{
            let cell:SettingDetailTableViewCell = SettingDetailTableViewCell.reusableCell(tableView: tableView) as! SettingDetailTableViewCell
            cell.configData(title: title, detail: detail)
            return cell
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.dataArr[indexPath.section][indexPath.row]
        let type =  model.type
        switch type {
        case .icon:
            self.selectHeadImage()
        break
        default:
        break
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.dataArr[indexPath.section][indexPath.row]
        let type =  model.type
        
        if type == .icon{
            return 70
        }
        else{
            return 50
        }
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 20))
        footView.backgroundColor = ColorTableViewBG
        
        return footView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return  UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
