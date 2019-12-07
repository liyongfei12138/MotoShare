//
//  MSVideoBottomToolBarView.swift
//  MotoShare
//
//  Created by houhanglei on 2019/12/7.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSVideoBottomToolBarView: HBSBaseView {

    lazy var photographButton: UIButton = {
        
        let button = UIButton.init(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "ms_travel_photograph"), for: .normal)
        button.tintColor = ColorTheme
        button.addTarget(self, action: #selector(self.photographButtonClick), for: .touchUpInside)
        self.addSubview(button)
        
        return button
    }()
    
    lazy var timeLabel: UILabel = {
        
        let label = UILabel.init()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        self.photographButton.addSubview(label)
        
        return label
    }()
    
    /// 点
    lazy var spotView: UIView = {
        
        let view = UIView.init()
        view.backgroundColor = .red
        view.layer.cornerRadius = 1.5
        self.addSubview(view)
        
        return view
    }()
    
    /// 时长
    lazy var durationLabel: UILabel = {
        
        let label = UILabel.init()
        label.textColor = TextColorLevel1
        label.font = UIFont.hbs_font(size: 13)
        self.addSubview(label)
        
        return label
    }()
    
    lazy var nextButton: UIButton = {
        
        let button = UIButton.init(type: .system)
        button.isHidden = true
        button.setImage(UIImage(named: "ms_travel_next"), for: .normal)
        button.tintColor = ColorTheme
        button.addTarget(self, action: #selector(self.nextButtonAction), for: .touchUpInside)
        self.addSubview(button)
        
        return button
    }()
    
    override func hbs_initView() {
        super.hbs_initView()
        
        self.backgroundColor = .white
        
        self.photographButton.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        self.nextButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.photographButton)
            make.centerX.equalTo(self.snp.left).offset(SCREEN_WIDTH / 6 * 5)
        }
        
        self.durationLabel.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(self.photographButton.snp.top)
        }
        
        self.spotView.snp.makeConstraints { (make) in
            
            make.right.equalTo(self.durationLabel.snp.left).offset(-3)
            make.centerY.equalTo(self.durationLabel)
            make.size.equalTo(CGSize(width: 3, height: 3))
        }
        self.durationLabel.isHidden = true
        self.spotView.isHidden = true
    }
    
    /// 更新当前录制时间
    /// - Parameter no: 数量
    func updateCurrentTimeNo(no: Int) {
        
        self.timeLabel.text = "\(31 - no)"

        if no == 31 {

            self.recordingComplete(timeNo: no - 1)

        }else {
            
            self.recordingStart()
        }
    }
    
    /// 开始录制
    func recordingStart() {
        
        self.durationLabel.isHidden = true
        self.spotView.isHidden = true
        self.nextButton.isHidden = true
    }
    
    /// 录制完成
    /// - Parameter timeNo: 录制秒数
    func recordingComplete(timeNo: Int) {
        
        self.durationLabel.text = "\(timeNo)秒"
        self.durationLabel.isHidden = false
        self.spotView.isHidden = false
        self.nextButton.isHidden = false
        
    }
    
// MARK:- 拍照事件
    @objc func photographButtonClick() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "录像"))
    }
    
// MARK:- 下一步事件
    @objc func nextButtonAction() {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "录制下一步"))
    }
}
