//
//  MSAmountViewCell.swift
//  MotoShare
//
//  Created by Mac on 2019/12/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSAmountViewCell: UITableViewCell {
    
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
        self.contentView.addSubview(self.amountField)
        self.contentView.addSubview(self.sepLineView)
        
        p_layout()
    }
    
    func p_layout(){
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(5)
        }
        
        self.amountField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
        }
        
        self.sepLineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
            make.right.equalTo(self.contentView)
        }
    }
    
    
    //MARK: - lazy load
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = "提现金额"
        return titleLabel
    }()
    
    lazy var amountLeftLabel: UILabel = {
        let amountLeftLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        amountLeftLabel.font = UIFont.systemFont(ofSize: 24)
        amountLeftLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        amountLeftLabel.text = "￥"
        return amountLeftLabel
    }()
    
    lazy var amountField: UITextField = {
        let amountField = UITextField.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        amountField.font = UIFont.systemFont(ofSize: 24)
        amountField.leftView = self.amountLeftLabel
        amountField.leftViewMode = .always
        return amountField
    }()
    
    lazy var sepLineView: UIView = {
        
        let sepLineView = UIView.init(frame: .zero)
        sepLineView.backgroundColor = ColorLineBG;
        return sepLineView
    }()
}
