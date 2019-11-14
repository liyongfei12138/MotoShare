//
//  MSChoiceDateViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSChoiceDateViewController: BaseViewController {

    let choiceDateViewHeight: CGFloat = 260 + HBS_C_HOMEINDICATOR_HEIHGT
    
    lazy var choiceDateView: MSChoiceDateView = {
        
        let view = MSChoiceDateView.view()
        self.view.addSubview(view)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bacViewTap = UITapGestureRecognizer.init(target: self, action: #selector(self.bacViewTapClick))
        self.view.addGestureRecognizer(bacViewTap)
        
        self.choiceDateView.snp.makeConstraints { (make) in
            
            make.left.right.equalToSuperview()
            make.bottom.equalTo(choiceDateViewHeight)
            make.height.equalTo(choiceDateViewHeight)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.choiceDateView.snp.updateConstraints { (make) in
            
            make.bottom.equalTo(0)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func bacViewTapClick() {
        
        self.hide(true)
    }
    
    /// 隐藏视图
    /// - Parameter animated: 是否动画
    func hide(_ animated: Bool) {
        
        self.choiceDateView.snp.updateConstraints { (make) in
            
            make.bottom.equalTo(choiceDateViewHeight)
        }

        if animated == true {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()

            }) { (_) in
                
                self.dismiss(animated: false, completion: nil)
            }

        }else {
           
            self.dismiss(animated: false, completion: nil)

        }
    }
    
    /// 弹出视图
    /// - Parameter viewController: 父视图
    func show(_ viewController: UIViewController) {
        
        self.modalPresentationStyle = .overCurrentContext
        viewController.present(self, animated: false) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        }
    }
    
}
