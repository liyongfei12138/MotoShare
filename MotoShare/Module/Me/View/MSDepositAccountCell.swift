//
//  MSDepositAccountCell.swift
//  MotoShare
//
//  Created by Mac on 2019/12/3.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSDepositAccountCell: UITableViewCell {
    
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
        
        self.accessoryType = .disclosureIndicator
    }
    
    func p_setUpUI() {
        self.contentView.addSubview(self.iconView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.detailLabel)
        
        p_layout()
    }
    
    func p_layout() {
        
        self.iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconView.snp.right).offset(20)
            make.top.equalTo(self.iconView.snp.top)
        }
        
        self.detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
        
    }
    
    // MARK: lazy load -
    
    lazy var iconView: UIImageView = {
        let iconView = UIImageView.init(frame: .zero)
        iconView.contentMode = .scaleAspectFill
        iconView.cornerRadius = 20
        iconView.image = UIImage.init(named: "logo")
        return iconView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = "摩的银行"
        return titleLabel
    }()
    
    lazy var detailLabel: UILabel = {
        let detailLabel = UILabel.init(frame: .zero)
        
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        detailLabel.text = "尾号7463 储蓄卡"
        return detailLabel
    }()
    
}
