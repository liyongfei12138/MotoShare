//
//  MSRentListTableView.swift
//  MotoShare
//
//  Created by mac on 2019/11/13.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentListTableView: HBSBaseTableView {

    override func hbs_initView() {
        
        self.tableView?.rowHeight = 150
        self.tableView?.register(cellWithClass: MSRentListCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withClass: MSRentListCell.self)
        cell.delegate = self.delegate
        cell.hbs_updateTableViewCell(nil)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "跳转租车详情", hbs_params: nil))
    }
    
}
