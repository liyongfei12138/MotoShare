//
//  CertiTableViewCell.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/2.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

typealias ClickIconBlock = (_ type:CertRowType)->()

class CertiTableViewCell: UITableViewCell {
    
    var type : CertRowType!
    var selectBlock : ClickIconBlock!
    
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = ColorWhite
        titleLabel.backgroundColor = .black
        titleLabel.alpha = 0.5
        titleLabel.text = ""
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    private lazy var certImgView: UIImageView = {
        let certImgView = UIImageView()
        certImgView.image = UIImage(named: "idcard_positive")
        certImgView.contentMode = .scaleAspectFill
        certImgView.clipsToBounds = true
        return certImgView
    }()
    
    private lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = ColorTheme
        bgView.alpha = 0.8
        bgView.cornerRadius = 35
        bgView.addViewTapTarget(self, action: #selector(clickSelect))
        return bgView
    }()
    
    private lazy var iconImgView: UIImageView = {
        let iconImgView = UIImageView()
        iconImgView.isUserInteractionEnabled = true
        iconImgView.image = UIImage(named: "change_photoalbum")
        return iconImgView
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.selectionStyle = .none
        self.backgroundColor = ColorTableViewBG
        
        self.addSubview(self.certImgView)
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.iconImgView)
        self.certImgView.addSubview(self.titleLabel)
        configLayout()
    }
    
    func congfigData(image:UIImage, type:CertRowType, detail:String)  {
        self.certImgView.image = image
        self.titleLabel.text = detail
        self.type = type
    }
    
    @objc func clickSelect(){
        self.selectBlock!(self.type)
    }
    
    private func configLayout()  {
        
  
        self.certImgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: SCREEN_WIDTH * 0.8, height: SCREEN_WIDTH * 0.7 * 0.64))
            make.bottom.equalToSuperview()
        }
        self.titleLabel.snp.makeConstraints { (make) in
              make.bottom.equalToSuperview()
              make.height.equalTo(30)
            make.width.equalToSuperview()
        }
        
        self.bgView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        self.iconImgView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        

    }

}
