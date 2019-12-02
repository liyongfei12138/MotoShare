//
//  CertificationViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import CDAlertView

public  enum CertifiType: Int  {
    case idCard
    case driver
    case other
}

class CertificationViewController: BaseViewController {

    lazy var remindLabel: UILabel = {
        let remindLabel = UILabel()
        remindLabel.font = UIFont.systemFont(ofSize: 14)
        remindLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        remindLabel.text = "完成认证后就可以去体验共享的美妙之处喽"
        remindLabel.textAlignment = .center
        remindLabel.backgroundColor = ColorTableViewBG
        return remindLabel
    }()
    
    
    lazy var dataArr: [Dictionary<String,Any>] = {
    
    
        
        let dataArr = [
                        ["title":"身份证认证","detail":User.stand.idCardString],
                        ["title":"驾驶证认证","detail":User.stand.driverivString]
                      ]
        return dataArr
    }()
    
    lazy var dataInfo: [String] = {
        let dataArr = [User.stand.idCardCert,"驾驶证认证"]
        return dataArr
    }()
    
    lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .plain)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorWhite
        listView.bounces = false
        listView.separatorStyle = .none
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "身份认证"
        self.view.backgroundColor = ColorWhite
        self.view.addSubview(self.remindLabel)
        self.view.addSubview(self.listView)
        configLayout()
        
        
    }
    
    private func configLayout()  {
        self.remindLabel.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(30)
        }
        self.listView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(self.remindLabel.snp.bottom)
        }
    }
    
    func gotoCertifition(type:CertifiType) {
        if type == .idCard{
            if User.stand.idCardIsBind{
                self.gotoCertifitionAlert(type: type)
            }else{
                
                gotoIdCard()
            }
        }else{
            if User.stand.driverIsBind{
                self.gotoCertifitionAlert(type: type)
            }else{
                gotoIdDriver()
            }
        }
    }
    
    
    func gotoCertifitionAlert(type:CertifiType) {
        if type == .idCard{
            
        }else{
            
        }
    }
    
    
    func gotoIdCard() {
        let idVc = IDCardViewController()
        self.navigationController?.pushViewController(idVc)
    }
    func gotoIdDriver() {
        let driverVc = DriverViewController()
        self.navigationController?.pushViewController(driverVc)
    }
}
extension CertificationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return self.dataArr.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let title = self.dataArr[indexPath.row]["title"] as! String
        let detail = self.dataArr[indexPath.row]["detail"] as! String


        let cell:SettingDetailTableViewCell = SettingDetailTableViewCell.reusableCell(tableView: tableView) as! SettingDetailTableViewCell
        cell.configData(title: title , detail: detail)
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var type:CertifiType = .other
        
        
        if indexPath.row == 0{
            type = .idCard
        }else{
            type = .driver
        }
        
        self.gotoCertifition(type: type)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
}
