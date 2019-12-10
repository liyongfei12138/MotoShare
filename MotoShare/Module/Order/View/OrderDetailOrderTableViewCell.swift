//
//  OrderDetailOrderTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/10.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OrderDetailOrderTableViewCell: UITableViewCell {
    
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

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.createCellUI()
        }
        private func createCellUI() {
            
            self.selectionStyle = .none
            
            addSubview(self.orderLabel)
            addSubview(self.statusLabel)
            addSubview(self.lineView)
        
        }
        
        func configData()  {
            configLayout()
        }
        private func configLayout()  {
            self.orderLabel.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(13)
                make.top.equalToSuperview().offset(16)
            }
            
            self.statusLabel.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-13)
                make.centerY.equalTo(self.orderLabel)
                make.bottom.equalToSuperview().offset(-16)
            }
            self.lineView.snp.makeConstraints { (make) in
                make.left.bottom.right.equalToSuperview()
                make.height.equalTo(1)
            }
            
          
        }

}
