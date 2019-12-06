//
//  OrderListViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController {

    lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .grouped)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorWhite
        listView.separatorStyle = .none
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = ColorTableViewBG
        self.view.addSubview(self.listView)
        configLayout()
    }
    private func configLayout()  {
  
        self.listView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(1)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Nav_topH)
        }
        
    }
    

}
extension OrderListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell:OrderTableViewCell = OrderTableViewCell.reusableCell(tableView: tableView) as! OrderTableViewCell
        
//        cell.backgroundColor = .random
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView()
        footerView.backgroundColor = ColorLineBG
        return footerView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return  UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
