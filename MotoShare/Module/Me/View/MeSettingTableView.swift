//
//  MeSettingTableView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit


public protocol MeSettingViewDelegate: class {
    // MARK: - Required

    func meSettingListViewTitleArray() -> Array<Array<SetBaseModel>>
    func meSettingListViewDidType(type:SettingRowType)
}

class MeSettingTableView: UITableView {
    
    open weak var settingDataSourse : MeSettingViewDelegate?
}
 
extension MeSettingTableView{
    convenience init() {
        self.init(frame:.zero,style:.grouped)
        self.delegate = self
        self.dataSource = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = ColorTableViewBG
        self.separatorStyle = .none
    }
}

extension MeSettingTableView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionData = self.settingDataSourse?.meSettingListViewTitleArray()
        let rowData = sectionData?[section]
        
        return rowData?.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let sectionData = self.settingDataSourse?.meSettingListViewTitleArray()
        return sectionData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionData = self.settingDataSourse?.meSettingListViewTitleArray()
        let rowData = sectionData?[indexPath.section]
        let title =  rowData?[indexPath.row].title ?? ""
        let type =  rowData?[indexPath.row].type ?? SettingRowType.other
        let detail = MeModel.getSettingDetail(type: type)
        
        
        
        if type == SettingRowType.logout{
            
            let cell:SetLogoutTableViewCell = SetLogoutTableViewCell.reusableCell(tableView: tableView) as! SetLogoutTableViewCell
            cell.configData(title:title)
            return cell
            
        }
        else if type == SettingRowType.realName||type == SettingRowType.passWord||type == SettingRowType.cache{
            
            let cell:SettingDetailTableViewCell = SettingDetailTableViewCell.reusableCell(tableView: tableView) as! SettingDetailTableViewCell
            cell.configData(title:title,detail: detail)
            return cell
            
        }
        else{
            let cell:SettingMainTableViewCell = SettingMainTableViewCell.reusableCell(tableView: tableView) as! SettingMainTableViewCell
            cell.configData(title:title)
            return cell
        }
        
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sectionData = self.settingDataSourse?.meSettingListViewTitleArray()
        let rowData = sectionData?[indexPath.section]
        let type =  rowData?[indexPath.row].type ?? SettingRowType.other
        
        self.settingDataSourse?.meSettingListViewDidType(type: type)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headView = UIView()
        headView.backgroundColor = ColorTableViewBG
        return headView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 13
    }
}
