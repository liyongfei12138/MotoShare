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
        self.tableView?.separatorStyle = .none
        
        self.tableView?.register(cellWithClass: MSDemandListCell.self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withClass: MSDemandListCell.self)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
