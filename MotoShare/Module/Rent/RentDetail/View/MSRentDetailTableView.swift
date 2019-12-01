//
//  MSRentDetailTableView.swift
//  MotoShare
//
//  Created by houhanglei on 2019/11/24.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSRentDetailTableView: HBSBaseTableView {

    lazy var bannerView: HBSBaseBannerView = {
        
        let bannerView = HBSBaseBannerView.bannerView()
        bannerView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH * 0.6)
        bannerView.update([UIImage(named: "ms_test_moto"),UIImage(named: "ms_test_moto")])
        
        return bannerView
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.tableView?.separatorStyle = .none
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.tableHeaderView = self.bannerView
        
        self.tableView?.register(cellWithClass: MSRentDetailInfoCell.self)
        self.tableView?.register(cellWithClass: MSRentDetailDescribeCell.self)
        self.tableView?.register(cellWithClass: MSRentDetailAddressCell.self)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
        
        if section == 1 {
            
            return 4
        }
        
        if section == 2 {
            
            return 1
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withClass: MSRentDetailInfoCell.self)
            cell.selectionStyle = .none
            cell.hbs_updateTableViewCell(nil)
            return cell

        }else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withClass: MSRentDetailDescribeCell.self)
            cell.selectionStyle = .none
            if indexPath.row == 0 {
                cell.describeLabel.text = "摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍摩托车介绍"
                cell.describeLabel.textColor = TextColorLevel1
                cell.describeLabel.font = UIFont.hbs_font(size: 16)
            }else if indexPath.row == 1 {
                cell.describeLabel.text = "所有要求加微信、QQ要求预订、付物流费的都是骗子！"
                cell.describeLabel.textColor = TextColorLevel3
                cell.describeLabel.font = UIFont.hbs_font(size: 12)
            }else if indexPath.row == 2 {
                cell.describeLabel.text = "发布时间：2019-11-25 11:11:11"
                cell.describeLabel.textColor = TextColorLevel3
                cell.describeLabel.font = UIFont.hbs_font(size: 12)
            }else if indexPath.row == 3 {
                cell.describeLabel.text = "租车必须购买骑行险，点击购买骑行险"
                cell.describeLabel.textColor = .blue
                cell.describeLabel.font = UIFont.hbs_font(size: 15)
            }
            return cell

        }
        
        let cell = tableView.dequeueReusableCell(withClass: MSRentDetailAddressCell.self)
        cell.selectionStyle = .none
        cell.hbs_updateTableViewCell(nil)
        return cell
    }

}
