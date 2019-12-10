//
//  OrderPriceTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/10.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OrderPriceTableViewCell: UITableViewCell {

       private lazy var depositLabel: UILabel = {
            let depositLabel = UILabel()
            depositLabel.font = UIFont.systemFont(ofSize: 14)
            depositLabel.textColor = UIColor.gl_hex(hex: 0x666666)
            depositLabel.text = "车辆押金"
            return depositLabel
        }()
     
    
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.selectionStyle = .none
            addSubview(self.depositLabel)
        }
           
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
           
    
           
        func configData()  {
           configLayout()
        }
    
        private func configLayout()  {

            self.depositLabel.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(13)
                make.top.equalToSuperview().offset(20)
                make.bottom.equalToSuperview().offset(-16)
            }

        }

}
