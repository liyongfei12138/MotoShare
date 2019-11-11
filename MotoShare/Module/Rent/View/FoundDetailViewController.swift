//
//  FoundDetailViewController.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/11/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class FoundDetailViewController: UIViewController {

    
    lazy var mainView: HomeMainListView = {
        let mainView = HomeMainListView()
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configMainView()
    }
    

    func configMainView() {
        
        self.mainView.configView(headView:UIView())
        self.view.addSubview(self.mainView)
        self.mainView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }

}
