//
//  OrderTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    private lazy var orderLabel: UILabel = {
        let orderLabel = UILabel()
        orderLabel.font = UIFont.systemFont(ofSize: 14)
        orderLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        orderLabel.text = "订单编号:129882233"
        return orderLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        statusLabel.text = "已完成"
        return statusLabel
    }()
    
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = ColorLineBG
        return lineView
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = UIColor.gl_hex(hex: 0x444444)
        timeLabel.text = "2019-08-14 19:23 至 2019-10-14 19:23"
        return timeLabel
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        
        addSubview(self.orderLabel)
        addSubview(self.lineView)
        addSubview(self.statusLabel)
        addSubview(self.timeLabel)
        configLayout()
    }
    private func configLayout()  {
        self.orderLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(16)
        }
        
        self.statusLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(self.orderLabel)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.orderLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        self.timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.orderLabel)
            make.top.equalTo(self.lineView.snp.bottom).offset(15)
            
        }
    }
}

