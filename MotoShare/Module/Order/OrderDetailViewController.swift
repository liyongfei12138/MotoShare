//
//  OrderDetailViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/9.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import FWPopupView
class OrderDetailViewController: BaseViewController {

    private lazy var moreBtn: UIButton = {
        let moreBtn = UIButton.init(type: .custom)
        moreBtn.setImage(UIImage.init(named: "common_more"), for: .normal)
        moreBtn.addTarget(self, action: #selector(clickMoreBtn), for: .touchUpInside)
        return moreBtn
    }()
//    
    lazy var moreView: FWMenuView = {
        
        let moreView = FWMenuViewProperty()
        moreView.popupCustomAlignment = .topRight
        moreView.popupAnimationType = .scale
        moreView.maskViewColor = UIColor(white: 0, alpha: 0.2)
        moreView.touchWildToHide = "1"
        moreView.popupViewEdgeInsets = UIEdgeInsets(top: Nav_topH, left: 0, bottom: 0, right: 8)
        moreView.topBottomMargin = 0
        moreView.animationDuration = 0.3
        moreView.popupArrowStyle = .round
        moreView.popupArrowVertexScaleX = 1
        moreView.backgroundColor = kPV_RGBA(r: 64, g: 63, b: 66, a: 1)
        moreView.splitColor = kPV_RGBA(r: 64, g: 63, b: 66, a: 1)
        moreView.separatorColor = kPV_RGBA(r: 91, g: 91, b: 93, a: 1)
        moreView.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.backgroundColor: UIColor.clear, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0)]
        moreView.textAlignment = .left
        moreView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        let menuView = FWMenuView.menu(itemTitles: ["删除订单","订单疑问"], itemImageNames: [UIImage(named: "order_delete"),UIImage(named: "order_doubt")] as? [UIImage], itemBlock: { (popupView, index, title) in
            print("Menu：点击了第\(index)个按钮")
        }, property: moreView)
        //                menuView.attachedView = self.view
        
        return menuView
    }()

    lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .grouped)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorWhite
        listView.separatorStyle = .none
        listView.estimatedRowHeight = 44
        listView.rowHeight = UITableView.automaticDimension
        return listView
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.moreBtn)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "订单详情"
        self.view.backgroundColor = ColorTableViewBG
        self.view.addSubview(self.listView)
        configLayout()
    }
    private func configLayout()  {
        
        self.listView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(1)
            make.bottom.left.right.equalToSuperview()
        }
              
    }
    @objc func clickMoreBtn(){
        self.moreView.show()
    }


}
extension OrderDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell:UITableViewCell = UITableViewCell.reusableCell(tableView: tableView) as! UITableViewCell

        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = OrderDetailViewController()
        self.navigationController?.pushViewController(vc)
        
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
//•••••
