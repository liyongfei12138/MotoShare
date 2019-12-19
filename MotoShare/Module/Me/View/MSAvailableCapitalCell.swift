//
//  MSAvailableCapitalCell.swift
//  MotoShare
//
//  Created by Mac on 2019/12/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSAvailableCapitalCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        p_initialize()
        
        p_setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func p_initialize() {
        self.selectionStyle = .none
    }
    
    func p_setUpUI() {
        
        self.contentView.addSubview(self.titleLabel)
        
        p_layout()
    }
    
    func p_layout() {
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: lazy load
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        titleLabel.text = "可用余额 98.0元"
        
        return titleLabel
    }()
}
