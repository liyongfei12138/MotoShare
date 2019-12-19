//
//  ChangeSexViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/28.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class ChangeSexViewController: BaseChangeViewController {

    var selectRow : String? = User.stand.sex
    
    lazy var dataArr: [String] = {
        let dataArr = ["男","女"]
        return dataArr
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

        self.doneBtnIsShow(isShow:true)
        
        self.title = "性别"
        self.view.addSubview(self.listView)

        configLayout()

    }
    func configLayout()  {
        self.listView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    override func done() {
        self.view.hbs_showIndicator(type: .ballRotateChase, color: ColorTheme, padding: 50)
             
        
        MeRequestModel.changeWithInfo(info: self.selectRow ?? User.stand.sex, type: .sex, { (data) in
        
            self.view.hbs_hideIndicator()
            self.dismiss(animated: true, completion: nil)
        }) {
            self.view.hbs_hideIndicator()
            HUDBase.showTitle(title: "修改失败")
        }

    }

}

extension ChangeSexViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return self.dataArr.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        self.selectRow =
        
        var select:Bool = false
        
        if self.dataArr[indexPath.row] == self.selectRow {
            select = true
        }else{
            select = false
        }
        let cell:SexTableViewCell = SexTableViewCell.reusableCell(tableView: tableView) as! SexTableViewCell
        cell.configData(title:self.dataArr[indexPath.row],isSelect:select)
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.selectRow = indexPath.row
        self.selectRow = self.dataArr[indexPath.row]
        self.listView.reloadData()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
}
