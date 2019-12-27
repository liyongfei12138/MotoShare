//
//  MSInputSettingViewCell.swift
//  MotoShare
//
//  Created by Mac on 2019/12/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

@objc protocol MSInputCellDelegate {
    
    func cellDidSelectedDetailBtn(detailBtn: UIButton)->()
    
    func updateInputFiled(identifier: String, inputText: String?) ->()
}

class MSInputSettingViewCell: UITableViewCell {
    
    var dataModel: InputSettingModel?
    weak var cellDelegate: MSInputCellDelegate?
    private var identifier: String?
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.titleLabel.text = "--"
        self.inputField.placeholder = "--"
        self.inputField.text = ""
        self.updateDetailBtnTitle(title: "")
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
            make.width.equalTo(60)
        }
        
        self.detailBtn.snp.remakeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
        }
        
        self.inputField.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right).offset(10)
            make.right.equalTo(self.detailBtn.snp.left).offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func p_detailBtnAction() {
        
        if self.cellDelegate != nil {
            self.cellDelegate?.cellDidSelectedDetailBtn(detailBtn: self.detailBtn)
        }
        
        print("\(#file)")
    }
    
    
    func updateCell(identifier: String?, model: InputSettingModel?) {
        
        self.identifier = identifier
        
        if model != nil {
            
            self.dataModel = model
            
            p_refreshData()
        }
    }
    
    /// 更新按钮标题
    func updateDetailBtnTitle(title: String?, state: UIControl.State = .normal) {
        
        if title != nil {
            self.detailBtn.isHidden = false
            self.detailBtn.setTitle(title!, for: state)
        }else {
            self.detailBtn.isHidden = true
            self.detailBtn.setTitle("", for: state)
        }
    }
    
    func p_refreshData(){
        
        if self.dataModel != nil {
            
            self.titleLabel.text = self.dataModel!.title
            self.inputField.placeholder = self.dataModel!.placeHolder
            self.updateDetailBtnTitle(title: self.dataModel!.detailBtnTitle)
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
        detailBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        detailBtn.addTarget(self, action: #selector(p_detailBtnAction), for: UIControl.Event.touchUpInside)
        return detailBtn
    }()
    
}
