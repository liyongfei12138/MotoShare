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
    private lazy var timeImgView: UIImageView = {
        let timeImgView = UIImageView()
//        timeImgView.image = UIImage(named: "order_time")
        timeImgView.backgroundColor = ColorLightRed
        timeImgView.cornerRadius = 3
        return timeImgView
    }()
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = UIColor.gl_hex(hex: 0x444444)
        timeLabel.text = "2019-08-14 19:23 至 2019-10-14 19:23"
        return timeLabel
    }()
    private lazy var placeImgView: UIImageView = {
        let placeImgView = UIImageView()
//        placeImgView.image = UIImage(named: "order_position")
        placeImgView.backgroundColor = ColorGreen
        placeImgView.cornerRadius = 3
        return placeImgView
    }()
    private lazy var placeLabel: UILabel = {
        let placeLabel = UILabel()
        placeLabel.font = UIFont.systemFont(ofSize: 14)
        placeLabel.textColor = UIColor.gl_hex(hex: 0x444444)
        placeLabel.text = "北京市朝阳区垡头翠城馨园126号楼1001"
        return placeLabel
    }()
    
    private lazy var infoImgView: UIImageView = {
        let infoImgView = UIImageView()
    //        placeImgView.image = UIImage(named: "order_position")
        infoImgView.backgroundColor = ColorTheme
        infoImgView.cornerRadius = 3
            return infoImgView
    }()
    private lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.textColor = UIColor.gl_hex(hex: 0x444444)
        infoLabel.text = "杜卡迪大魔鬼单日出租"
        return infoLabel
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
        addSubview(self.lineView)
        addSubview(self.statusLabel)
        addSubview(self.timeLabel)
        addSubview(self.timeImgView)
        addSubview(self.placeLabel)
        addSubview(self.placeImgView)
        addSubview(self.infoLabel)
        addSubview(self.infoImgView)
        
    }
    
    func configData()  {
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
        self.timeImgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.orderLabel)
            make.top.equalTo(self.lineView.snp.bottom).offset(15)
            make.size.equalTo(CGSize(width: 6, height: 6))
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.timeImgView.snp.right).offset(5)
            make.centerY.equalTo(self.timeImgView)
            make.right.equalToSuperview().offset(-15)
        }
        self.placeImgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.timeImgView)
            make.top.equalTo(self.timeLabel.snp.bottom).offset(15)
            make.size.equalTo(self.timeImgView)
            
        }
        
        self.placeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.placeImgView.snp.right).offset(5)
            make.centerY.equalTo(self.placeImgView)
            make.right.equalTo(self.timeLabel)
        }
        self.infoImgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.placeImgView)
            make.top.equalTo(self.placeLabel.snp.bottom).offset(15)
            make.size.equalTo(self.placeImgView)
            make.bottom.equalToSuperview().offset(-25)
            
        }
        
        self.infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.infoImgView.snp.right).offset(5)
            make.centerY.equalTo(self.infoImgView)
            make.right.equalTo(self.placeLabel)
            
        }
    }
}

