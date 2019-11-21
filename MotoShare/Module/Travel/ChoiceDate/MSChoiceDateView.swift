//
//  MSChoiceDateView.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSChoiceDateView: HBSBaseView {

    var dateString: String!
    
    lazy var cancelButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.setTitle("取消", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(size: 15)
        button.addTarget(self, action: #selector(self.cancelButtonAction), for: .touchUpInside)
        self.addSubview(button)
        
        return button
    }()
    
    lazy var confirmButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.setTitle("确认", for: .normal)
        button.setTitleColor(ColorTheme, for: .normal)
        button.titleLabel?.font = UIFont.hbs_font(.medium, size: 15)
        button.addTarget(self, action: #selector(self.confirmButtonAction), for: .touchUpInside)
        self.addSubview(button)
        
        return button
    }()

    lazy var datePicker: UIDatePicker = {
        
        let picker = UIDatePicker.init()
        picker.datePickerMode = .date
        picker.locale = Locale.init(identifier: "zh_CN")
//        picker.minimumDate = Date()
        picker.addTarget(self, action: #selector(self.chooseDate(_:)), for: .valueChanged)
        self.addSubview(picker)
        
        return picker
    }()
    
    override func hbs_initView() {
        
        self.backgroundColor = .white
        
        let dateFormoter = DateFormatter.init()
        dateFormoter.dateFormat = "YYYY-MM-dd"
        let dateString = dateFormoter.string(from: Date())

        self.dateString = dateString

        self.cancelButton.snp.makeConstraints { (make) in
            
            make.top.left.equalToSuperview()
            make.size.equalTo(CGSize(width: 70, height: 40))
        }
        
        self.confirmButton.snp.makeConstraints { (make) in
            
            make.top.right.equalToSuperview()
            make.size.equalTo(self.cancelButton)
        }
        
        self.datePicker.snp.makeConstraints { (make) in
            
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-HBS_C_HOMEINDICATOR_HEIHGT)
            make.top.equalTo(40)
        }
    }
    
    @objc func cancelButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "关闭"))
        
    }
    
    @objc func confirmButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "选择时间", hbs_params: self.dateString))
    }
    
//    选择时间事件
    @objc func chooseDate(_ datePicker: UIDatePicker) {
        
        let chooseDate = datePicker.date
        let dateFormoter = DateFormatter.init()
        dateFormoter.dateFormat = "YYYY-MM-dd"
        self.dateString = dateFormoter.string(from: chooseDate)
    }
    
}
