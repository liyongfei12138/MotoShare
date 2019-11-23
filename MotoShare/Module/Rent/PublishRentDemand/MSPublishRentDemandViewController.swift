//
//  MSPublishRentDemandViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/21.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishRentDemandViewController: BaseViewController {

    var protocolButton: UIButton!
    
    lazy var publishTableView: MSPublisthTravelTableView = {
        
        let tableView = MSPublisthTravelTableView.view()
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        tableView.tableView?.tableFooterView = self.publishTableFooterView
        
        return tableView
    }()
    
    lazy var publishTableFooterView: UIView = {
        
        let view = UIView.init()
        view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 60)
        
        self.protocolButton = UIButton.init(type: .system)
        self.protocolButton.tintColor = .clear
        self.protocolButton.setImage(UIImage(named: "login_noselect")?.original, for: .normal)
        self.protocolButton.setImage(UIImage(named: "login_select")?.original, for: .selected)
        self.protocolButton.setTitle("《保障协议》", for: .normal)
        self.protocolButton.setTitleColor(ColorTheme, for: .normal)
        self.protocolButton.setTitleColor(ColorTheme, for: .selected)
        self.protocolButton.addTarget(self, action: #selector(self.protocolButtonAction), for: .touchUpInside)
        view.addSubview(self.protocolButton)
        
        self.protocolButton.snp.makeConstraints { (make) in
            
            make.left.equalTo(15)
            make.top.equalTo(30)
        }
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "租赁摩托"
        
        self.publishTableView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
    
        self.publishTableView.hbs_updateTableView(datas: self.getPublishTravelModels())
    }
    
    /// 保障协议点击事件
    @objc func protocolButtonAction() {
        
        self.protocolButton.isSelected = !self.protocolButton.isSelected
    }
    
    /// 获取数据源
    func getPublishTravelModels() -> [MSPublishTravelBaseModel] {
        
        let model1 = MSPublishTravelClickModel.init()
        model1.title = "品牌型号"
        model1.tips = "点击选择品牌"
        
        let model2 = MSPublishTravelTextViewModel.init()
        model2.title = "说明"
        model2.tips = "填写您的说明或者要求"

        let model3 = MSPublishTravelTextFieldModel.init()
        model3.title = "排量"
        model3.tips = "输入排量"

        let model4 = MSPublishTravelTextFieldModel.init()
        model4.title = "期望押金"
        model4.tips = "输入期望押金"

        let model5 = MSPublishTravelTextFieldModel.init()
        model5.title = "期望价格"
        model5.tips = "输入期望价格"

        let model6 = MSPublishTravelTextFieldModel.init()
        model6.title = "租赁天数"
        model6.tips = "输入租赁天数"

        let model7 = MSPublishTravelClickModel.init()
        model7.title = "我的位置"
        model7.tips = "点击选择位置"
        

        return [model1,model2,model3,model4,model5,model6,model7]
    }

}
