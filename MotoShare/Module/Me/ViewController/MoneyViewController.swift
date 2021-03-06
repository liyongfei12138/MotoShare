//
//  MoneyViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MoneyViewController: BaseViewController {

    private lazy var reloadBtn: UIButton = {
        let reloadBtn = UIButton(type: .custom)
        reloadBtn.setImage(UIImage(named: "money_reload"), for: .normal)
        reloadBtn.addTarget(self, action: #selector(clickReloadBtn), for: .touchUpInside)
        return reloadBtn
    }()
    
    private var dataArr:[[MoneyBaseModel]] {
        return MeModel.getMoneyListData()
    }
    private lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .grouped)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorTableViewBG
        listView.separatorStyle = .none
        listView.bounces = false
        return listView
    }()
    private lazy var headView:BalanceView = {
        let headView = BalanceView()
        headView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.2)
        return headView
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem.init(customView: self.reloadBtn)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "钱包"
        self.view.backgroundColor = ColorTableViewBG
        
        self.headView.configBalance(title: "98.9")
        self.listView.tableHeaderView = self.headView
        self.view.addSubview(self.listView)
        configLayout()
    }
    func configLayout()  {
        self.listView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    @objc private func clickReloadBtn(){
        
        
    }
}

extension MoneyViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return self.dataArr[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

       let cell:MoneyMainTableViewCell = MoneyMainTableViewCell.reusableCell(tableView: tableView) as! MoneyMainTableViewCell
        
        let array = self.dataArr[indexPath.section]
        
        cell.configData(title: array[indexPath.row].title ?? "",type: array[indexPath.row].type ?? .other)
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let array = self.dataArr[indexPath.section]

        let model = array[indexPath.row]
        
        switch model.type {
        case .getMoney:
            
            p_toDeposit()
        case .record:
            return
        case .idCard:
            return
        case .driver:
            return
        case .other:
            return
        case .none:
            return
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 20))
        footView.backgroundColor = ColorTableViewBG
        
        return footView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return  UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 20
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}


extension MoneyViewController {
    
    func p_toDeposit() {
        
        let depositVC = MSDepositViewController.init()
        
        self.navigationController?.pushViewController(depositVC, animated: true)
    }
    
}
 
