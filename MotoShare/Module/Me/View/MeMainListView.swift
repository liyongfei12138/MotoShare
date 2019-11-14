//
//  MeMainTableView.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
public protocol MeViewDataSource: class {
    // MARK: - Required

    func meListViewTitleArray() -> Array<String>
    func meListViewIconArray() -> Array<String>
}
class MeMainListView: UITableView {
    
    open weak var meDataSourse : MeViewDataSource?
}
 
extension MeMainListView{
    convenience init() {
        self.init(frame:.zero,style:.grouped)
        self.delegate = self
        self.dataSource = self
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = ColorWhite
        self.separatorStyle = .none
    }
}

extension MeMainListView:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meDataSourse?.meListViewTitleArray().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MeListTableViewCell = MeListTableViewCell.reusableCell(tableView: tableView) as! MeListTableViewCell
        cell.backgroundColor = ColorWhite
        let title = self.meDataSourse?.meListViewTitleArray()[indexPath.row] ?? ""
        let icon = self.meDataSourse?.meListViewIconArray()[indexPath.row] ?? ""
        cell.configData(title:title, imgSting: icon)
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 45
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
