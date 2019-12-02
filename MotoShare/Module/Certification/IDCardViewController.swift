//
//  IDCardCertViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/29.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class IDCardViewController: UIViewController {

    lazy var remindLabel: UILabel = {
        let remindLabel = UILabel()
        remindLabel.font = UIFont.systemFont(ofSize: 14)
        remindLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        remindLabel.text = "为保障您的审核进度请本人进行验证"
        remindLabel.textAlignment = .center
        remindLabel.backgroundColor = ColorTableViewBG
        return remindLabel
    }()
    private lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .plain)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorTableViewBG
        listView.separatorStyle = .none
        listView.bounces = false
        return listView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "身份证认证"
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

}
extension IDCardViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

       let cell:CertiTableViewCell = CertiTableViewCell.reusableCell(tableView: tableView) as! CertiTableViewCell
        
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }

}
