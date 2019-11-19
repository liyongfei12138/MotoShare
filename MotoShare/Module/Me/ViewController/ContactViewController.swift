//
//  ContactViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class ContactViewController: BaseViewController {

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x000000)
        titleLabel.text = "添加紧急联系人"
        return titleLabel
    }()
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 12)
        contentLabel.textColor = UIColor.gl_hex(hex: 0x666666)
        contentLabel.numberOfLines = 0
        let attributedString = NSMutableAttributedString(string: " • 设置后尽在使用110报警或紧急情况下，会自动通知紧急联系人 \n • 目前仅支持号码为归属地为中国大陆的手机号码 \n • 添加或修改紧急联系人后请及时通知对方")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        contentLabel.attributedText = attributedString;
        
        return contentLabel
    }()
    
    lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .plain)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorWhite
        listView.separatorStyle = .none
        listView.bounces = false
        return listView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "紧急联系人"
        
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.contentLabel)
        self.view.addSubview(self.listView)
        configLayout()
    }
    func configLayout()  {
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(18)
        }
        
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(15)
            make.left.equalTo(self.titleLabel)
            make.right.equalToSuperview().offset(-18)
        }
        
        self.listView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentLabel.snp.bottom).offset(15)
            make.left.bottom.right.equalToSuperview()
        }
    }

}

extension ContactViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return 4
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        if indexPath.row == 3 {
            let cell:ContactAddTableViewCell = ContactAddTableViewCell.reusableCell(tableView: tableView) as! ContactAddTableViewCell
            return cell
        }else{
            let cell:ContactTableViewCell = ContactTableViewCell.reusableCell(tableView: tableView) as! ContactTableViewCell
            cell.configData(title:"15776627777",name: "爸比")
            cell.clickEditBlock = { (info) in
                let editVC = ContactManageViewController.init(type:.edit,info:info)
                self.navigationController?.pushViewController(editVC)
                
            }
            return cell
        }
        

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 3 {
           let editVC = ContactManageViewController.init(type:.add)
            self.navigationController?.pushViewController(editVC)
        }else{
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }

}
