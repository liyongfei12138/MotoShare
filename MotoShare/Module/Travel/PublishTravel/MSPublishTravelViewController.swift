//
//  MSPublishTravelViewController.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublishTravelViewController: BaseViewController,MSResourceManagerViewControllerDelegate {
    
    /// 发布摩旅数据源
    var publishModels: Array<MSPublishTravelBaseModel> = []
    
    lazy var publishTableView: MSPublisthTravelTableView = {
        
        let tableView = MSPublisthTravelTableView.view()
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "发布摩旅"
        
        self.publishTableView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
        }
        
        self.publishModels = self.getPublishTravelModels()
        
        self.publishTableView.hbs_updateTableView(datas: self.publishModels)
    }
    
    func hbs_viewEvent(_ view: UIView, hbs_eventObject: HBSViewEventObject) {
        
        if hbs_eventObject.hbs_eventType == "出发时间" {
            
            let choiceDateVC = MSChoiceDateViewController.init()
            choiceDateVC.show(self)
            
            choiceDateVC.choiceComple = {dateString in
                
                let timeModel = self.publishModels[3]
                timeModel.result = dateString

                self.publishTableView.hbs_reloadData()
            }
            
        }else if hbs_eventObject.hbs_eventType == "出发地" {
            
        }else if hbs_eventObject.hbs_eventType == "目的地" {
            
        }else if hbs_eventObject.hbs_eventType == "添加新图片/视频" {
            
            let resourceManagerVC = MSResourceManagerViewController.init()
            resourceManagerVC.delegate = self
            self.navigationController?.pushViewController(resourceManagerVC)
        }
    }
    
    /// 获取数据源
    func getPublishTravelModels() -> [MSPublishTravelBaseModel] {
        
        let model1 = MSPublishTravelClickModel.init()
        model1.title = "出发时间"
        model1.tips = "点击选择时间"
        
        let model2 = MSPublishTravelTextViewModel.init()
        model2.title = "摩旅说明"
        model2.tips = "介绍一下旅途的注意事项吧"

        let model3 = MSPublishTravelTextFieldModel.init()
        model3.title = "联系方式"
        model3.tips = "任何人都可以看哦"

        let model4 = MSPublishTravelClickModel.init()
        model4.title = "出发地"
        model4.tips = "点击选择出发地"

        let model5 = MSPublishTravelClickModel.init()
        model5.title = "目的地"
        model5.tips = "点击选择目的地"

        let model6 = MSPublishTravelFilesModel.init()
        model6.title = "上传照片"
        model6.tips = "照片/视频"

        return [model2,model6,model3,model1,model4,model5]
    }
    
//    MSResourceManagerViewControllerDelegate
    func videoChoiceFinish(asset: MSPHAsset) {
        
        let filesModel = self.publishModels[1] as? MSPublishTravelFilesModel
        
        filesModel?.msAssets.removeAll()
        filesModel?.msAssets.append(asset)
        
        self.publishTableView.hbs_reloadData()
    }
    
    func imageChoiceFinish(assets: [MSPHAsset]) {
        
        let filesModel = self.publishModels[1] as? MSPublishTravelFilesModel
        filesModel?.msAssets = filesModel!.msAssets + assets
        
        self.publishTableView.hbs_reloadData()

    }
    
}
