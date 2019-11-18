//
//  MSAlbumFolderView.swift
//  MotoShare
//
//  Created by mac on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSAlbumFolderView: UIView {

    var viewSize: CGSize!
    
    /// 毛玻璃背景
    lazy var blurEffectView: UIVisualEffectView = {
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView.init(effect: blurEffect)
        blurEffectView.layer.cornerRadius = 20
        blurEffectView.layer.masksToBounds = true
        blurEffectView.contentView.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.addSubview(blurEffectView)
        
        return blurEffectView
    }()
    
    /// 相册文件夹
    lazy var folderTableView: MSAlbumFolderTableView = {
        
        let tableView = MSAlbumFolderTableView.view()
        self.blurEffectView.contentView.addSubview(tableView)
        
        return tableView
    }()
    
    class func folderView() -> MSAlbumFolderView {
        
        let view = MSAlbumFolderView.init()
        view.isHidden = true
        view.initView()
        return view
    }
    
    func initView() {
        
        self.backgroundColor = UIColor.white.withAlphaComponent(0)
                   
        self.blurEffectView.snp.makeConstraints { (make) in
            
            make.top.equalTo(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: SCALEWIDTH(width: 300), height: SCALEWIDTH(width: 350)))
        }
        
        self.folderTableView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
    }
    
    func show(_ animated: Bool = true) {
        
        self.isHidden = false
        
        if animated == true {
            
            
            UIView.animate(withDuration: 0.2) {
                self.blurEffectView.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
            }

        }else {
            
            self.blurEffectView.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        }
        
        self.folderTableView.updateAlbumFolderTableView(datas: [MSAlbumDataManager.getSmartAlbumAssetCollection(),MSAlbumDataManager.getAlbumAssetCollection()])
    }
    
    func hide(_ animated: Bool = true) {
                  
        if animated == true {
            
            UIView.animate(withDuration: 0.2, animations: {
                self.blurEffectView.contentView.backgroundColor = UIColor.white.withAlphaComponent(0)

            }) { (_) in
                
                self.isHidden = true

            }

        }else {
            
            self.isHidden = true

        }
    }
}
