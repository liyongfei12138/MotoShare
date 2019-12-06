//
//  OrderViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import DNSPageView
class OrderViewController: BaseViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11, *) {
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        self.title = "订单详情"
        
        configUi()
        
    }
    
    func configUi() {
                // 创建PageStyle，设置样式
        let style = PageStyle()
        style.isTitleViewScrollEnabled = true
        style.isTitleScaleEnabled = true
        style.titleSelectedColor = ColorTheme
        style.titleColor = UIColor.gl_hex(hex: 0x666666)
        
        // 设置标题内容
        let titles = ["我出租的", "我租到的"]

        // 创建每一页对应的controller
        for i in 0..<titles.count {
            let controller = OrderListViewController()
            addChild(controller)
        }


        // 创建对应的DNSPageView，并设置它的frame
        let pageView = PageView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: style, titles: titles, childViewControllers: children)
        view.addSubview(pageView)
    }
}
