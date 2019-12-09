//
//  MSAccountListViewController.swift
//  MotoShare
//
//  Created by Mac on 2019/12/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSAddAccountViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {


        // MARK: - define ---
        let depositSettingInputCell_id_1 = "depositSettingInputCell_id_1"
        
        // MARK: - life cycle --
        override func viewDidLoad() {
            super.viewDidLoad()
            
            p_initialize()
            
            p_setUpUI()

        }
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            
            p_showKeyBoard()
        }
    
    // MARK: - pivite method --
        func p_initialize() {
            
        }
        
        func p_setUpUI() {
            
            self.view.addSubview(self.listView)
            
            p_layout()
        }
        
        func p_layout(){
            
            self.listView.snp.makeConstraints { (make) in
                make.left.right.top.bottom.equalToSuperview()
            }
        }
        
        func p_showKeyBoard() {
            
            let cell: MSInputSettingViewCell? = self.listView.visibleCells.single { (cell) -> Bool in
                return cell is MSInputSettingViewCell
                } as? MSInputSettingViewCell
            
            cell?.inputField.becomeFirstResponder()
        }
        
        @objc func p_confirmBtnAction() {
            
            self.confirmBtn.gl_startCenterIndicatorView()
            self.confirmBtn.setTitle("", for: UIControl.State.normal)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.confirmBtn.gl_stopIndicatorView(inView: nil)
                self.confirmBtn.setTitle("", for: UIControl.State.normal)
            }
            print("绑定支付宝")
            
        }
        
        // MARK - UITableview delegate method ---
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                        
            return self.dataSource.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = self.dataSource[indexPath.row]
                       
            let cell: MSInputSettingViewCell = tableView.dequeueReusableCell(withIdentifier: depositSettingInputCell_id_1, for: indexPath) as! MSInputSettingViewCell
           
            cell.updateCell(model: model)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let model = self.dataSource[indexPath.row]
                    
            return model.cellHeight;
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            let sectionView = UIView.init()
            sectionView.backgroundColor = UIColor.clear
            return sectionView
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 20
        }
        
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            return UIView.init()
        }

        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return CGFloat.zero
        }
        
        // MARK - lazy load --
        
        lazy var listView: UITableView = {
            let listView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
            listView.backgroundColor = ColorTableViewBG
            listView.delegate = self
            listView.dataSource = self
            listView.separatorStyle = .none
            listView.estimatedRowHeight = 0
            listView.showsVerticalScrollIndicator = false
            listView.showsHorizontalScrollIndicator = false
            
            if #available(iOS 11.0, *) {
                listView.contentInsetAdjustmentBehavior = .never
            }
            listView.register(MSDepositAccountCell.self, forCellReuseIdentifier: depositSettingInputCell_id_1)
            listView.tableFooterView = self.footerView
            return listView
        }()
        
        lazy var dataSource: [InputSettingModel] = {
            let dataSource = InputSettingModel.getAddAccountListModels()
            return dataSource
        }()
        
        lazy var confirmBtn: UIButton = {
            let confirmBtn = UIButton.init(frame: .zero)
            confirmBtn.setTitle("绑定支付宝", for: .normal)
            confirmBtn.backgroundColor = ColorTheme
            confirmBtn.cornerRadius = 10
            confirmBtn.addTarget(self, action: #selector(p_confirmBtnAction), for: UIControl.Event.touchUpInside)
            return confirmBtn
        }()
        
        lazy var footerView: UIView = {
            let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 100))
            footerView.addSubview(self.confirmBtn)
            self.confirmBtn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSize.init(width: SCREEN_WIDTH - 40, height: 48))
            }
            return footerView
        }()
        

}
