//
//  TimeTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/10.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OrderTimeTableViewCell: UITableViewCell {

    private lazy var beginLabel: UILabel = {
        let beginLabel = UILabel()
        beginLabel.font = UIFont.systemFont(ofSize: 14)
        beginLabel.textColor = UIColor.gl_hex(hex: 0x1F1F1F)
        beginLabel.text = "11月20日 13:20"
        return beginLabel
    }()
    private lazy var beginYearLabel: UILabel = {
        let beginYearLabel = UILabel()
        beginYearLabel.font = UIFont.systemFont(ofSize: 14)
        beginYearLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        beginYearLabel.text = "2019"
        return beginYearLabel
    }()
    
    private lazy var centerLineView: UIView = {
        let centerLineView = UIView()
        centerLineView.backgroundColor = ColorLineBG
        return centerLineView
    }()
    private lazy var dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.font = UIFont.systemFont(ofSize: 14)
        dayLabel.textColor = ColorTheme
        dayLabel.text = "3天"
        return dayLabel
    }()
     private lazy var endLabel: UILabel = {
        let endLabel = UILabel()
        endLabel.font = UIFont.systemFont(ofSize: 14)
        endLabel.textColor = UIColor.gl_hex(hex: 0x1F1F1F)
        endLabel.text = "11月23日 13:20"
        return endLabel
      }()
     private lazy var endYearLabel: UILabel = {
         let endYearLabel = UILabel()
         endYearLabel.font = UIFont.systemFont(ofSize: 14)
         endYearLabel.textColor = UIColor.gl_hex(hex: 0x666666)
         endYearLabel.text = "2019"
         return endYearLabel
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
             
            addSubview(self.beginLabel)
            addSubview(self.beginYearLabel)
            addSubview(self.lineView)
            addSubview(self.centerLineView)
            addSubview(self.dayLabel)
            addSubview(self.endLabel)
            addSubview(self.endYearLabel)
         
         }
         
         func configData()  {
             configLayout()
         }
         private func configLayout()  {
             self.beginLabel.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(13)
                make.top.equalToSuperview().offset(16)
             }
             
             self.beginYearLabel.snp.makeConstraints { (make) in
                make.centerX.equalTo(self.beginLabel)
                make.top.equalTo(self.beginLabel.snp.bottom).offset(6)
                make.bottom.equalToSuperview().offset(-16)
             }
            self.centerLineView.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(10)
                make.size.equalTo(CGSize(width: 90, height:1))
            }
            self.dayLabel.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.centerLineView.snp.top).offset(-6)
            }
            
            
             self.lineView.snp.makeConstraints { (make) in
                 make.left.bottom.right.equalToSuperview()
                 make.height.equalTo(1)
             }
            self.endLabel.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-13)
                make.top.equalTo(self.beginLabel)
            }
            
            self.endYearLabel.snp.makeConstraints { (make) in
               make.centerX.equalTo(self.endLabel)
                make.bottom.equalTo(self.beginYearLabel)
            }
            
             
           
         }


}
