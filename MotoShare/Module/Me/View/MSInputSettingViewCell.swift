//
//  MSInputSettingViewCell.swift
//  MotoShare
//
//  Created by Mac on 2019/12/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSInputSettingViewCell: UITableViewCell {

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
    
    func p_initialize(){
        self.selectionStyle = .none
        
    }
    
    func p_setUpUI() {
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.inputField)
        self.contentView.addSubview(self.detailBtn)
        
        p_layout()
    }
    
    func p_layout(){
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
        
        self.detailBtn.snp.remakeConstraints { (make) in
            make.right.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        self.inputField.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right).offset(10)
            make.right.equalTo(self.detailBtn.snp.left).offset(-10)
        }
        
    }
    
    @objc func p_detailBtnAction() {
        
        print("\(#file)")
    }
    
    
    func updateCell(model: InputSettingModel) {
        
        if model != nil {
            self.titleLabel.text = model.title
            self.inputField.placeholder = model.placeHolder
            self.detailBtn.setTitle(model.detailTitle, for: UIControl.State.normal)
        }
    }
    
    
    //MARK: - lazy load --
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x2E2E2E)
        titleLabel.text = "title"
        return titleLabel
    }()
    
    lazy var inputField: UITextField = {
        let inputField = UITextField.init(frame: .zero)
        inputField.placeholder = "placeHolder"
        inputField.font = UIFont.systemFont(ofSize: 14.0)
        return inputField
    }()
    
    lazy var detailBtn: UIButton = {
        let detailBtn = UIButton.init(frame: CGRect.zero)
        detailBtn.setTitle("detailBtn", for: UIControl.State.normal)
        detailBtn.setTitleColor(ColorTheme, for: UIControl.State.normal)
        detailBtn.addTarget(self, action: #selector(p_detailBtnAction), for: UIControl.Event.touchUpInside)
        return detailBtn
    }()
    
}
