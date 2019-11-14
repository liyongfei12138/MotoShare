//
//  MSPublisthTravelTableView.swift
//  MotoShare
//
//  Created by mac on 2019/11/14.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class MSPublisthTravelTableView: HBSBaseTableView {

    override func hbs_initView() {
        super.hbs_initView()
        
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.separatorStyle = .none
        
        self.tableView?.register(cellWithClass: MSPublishTravelBaseCell.self)
        self.tableView?.register(cellWithClass: MSPublishTravelClickCell.self)
        self.tableView?.register(cellWithClass: MSPublishTravelTextViewCell.self)
        self.tableView?.register(cellWithClass: MSPublishTravelTextFieldCell.self)
        self.tableView?.register(cellWithClass: MSPublishTravelFilesCell.self)

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.datas[indexPath.row]
                
        if model is MSPublishTravelClickModel {
            
            let cell = tableView.dequeueReusableCell(withClass: MSPublishTravelClickCell.self)
            cell.updatePublishTravelCell(model: model as! MSPublishTravelClickModel)
            cell.selectionStyle = .none
            return cell
        
        }
        
        if model is MSPublishTravelTextViewModel {
            
            let cell = tableView.dequeueReusableCell(withClass: MSPublishTravelTextViewCell.self)
            cell.updatePublishTravelCell(model: model as! MSPublishTravelTextViewModel)
            cell.selectionStyle = .none
            return cell
        
        }
        
        if model is MSPublishTravelTextFieldModel {
            
            let cell = tableView.dequeueReusableCell(withClass: MSPublishTravelTextFieldCell.self)
            cell.updatePublishTravelCell(model: model as! MSPublishTravelTextFieldModel)
            cell.selectionStyle = .none
            return cell
        
        }
        
        if model is MSPublishTravelFilesModel {
            
            let cell = tableView.dequeueReusableCell(withClass: MSPublishTravelFilesCell.self)
            cell.updatePublishTravelCell(model: model as! MSPublishTravelFilesModel)
            cell.selectionStyle = .none
            return cell
        
        }
        
        return tableView.dequeueReusableCell(withClass: MSPublishTravelBaseCell.self)
    }

}
