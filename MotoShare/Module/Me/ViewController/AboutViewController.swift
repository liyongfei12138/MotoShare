//
//  AboutViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {

    lazy var iconImgView: UIImageView = {
           let iconImgView = UIImageView()
        iconImgView.image = UIImage(named: "logo")
           return iconImgView
       }()
       
    lazy var titleLabel: UILabel = {
           let titleLabel = UILabel()
           titleLabel.font = UIFont.systemFont(ofSize: 12)
           titleLabel.textColor = UIColor.gl_hex(hex: 0x6E6E6E)
           titleLabel.text = ""
           return titleLabel
       }()
    lazy var dataArr: [String] = {
        
        return ["版本记录","联系我们"]
    }()
    lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .plain)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorTableViewBG
        listView.separatorStyle = .none
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "关于"
        self.view.backgroundColor = ColorTableViewBG
        self.titleLabel.text = "©摩滴共享 v1.0"
        self.view.addSubview(self.iconImgView)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.listView)
        configLayout()
        
    }
    func configLayout()  {
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
        }
        
        self.iconImgView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.titleLabel.snp.top).offset(-15)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        self.listView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.iconImgView.snp.top).offset(-15)
        }
    }

}

extension AboutViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return self.dataArr.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell:SettingMainTableViewCell = SettingMainTableViewCell.reusableCell(tableView: tableView) as! SettingMainTableViewCell
        cell.configData(title:self.dataArr[indexPath.row])
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headView = UIView()
        headView.backgroundColor = ColorTableViewBG
        return headView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 13
    }
}
