//
//  MSDemandListTableView.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSDemandListTableView: HBSBaseTableView {

    override func hbs_initView() {
        super.hbs_initView()
        
        self.tableView?.backgroundColor = UIColor.init(hex: 0xf5f5f5)
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = 150
        self.tableView?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.tableView?.register(cellWithClass: MSDemandListCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withClass: MSDemandListCell.self)
        cell.selectionStyle = .none
        cell.hbs_updateTableViewCell(nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
