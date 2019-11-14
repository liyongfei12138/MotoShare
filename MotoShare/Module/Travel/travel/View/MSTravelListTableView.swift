//
//  MSTravelListTableView.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSTravelListTableView: HBSBaseTableView {

    override func hbs_initView() {
        super.hbs_initView()
        
        self.tableView?.rowHeight = 260
        self.tableView?.separatorStyle = .none
        
        self.tableView?.register(cellWithClass: MSTravelListCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withClass: MSTravelListCell.self)
        cell.selectionStyle = .none
        cell.hbs_updateTableViewCell(nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
