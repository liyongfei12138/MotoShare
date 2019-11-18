//
//  MSAlbumFolderTableView.swift
//  MotoShare
//
//  Created by mac on 2019/11/18.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Photos

class MSAlbumFolderTableView: HBSBaseTableView {

    var folderDatas: Array<PHFetchResult<PHAssetCollection>> = []
    
    override func hbs_initView() {
        
        self.tableView?.rowHeight = 120
        self.tableView?.separatorStyle = .none
        
        self.tableView?.register(cellWithClass: MSAlbumFolderTableViewCell.self)
    }
    
    func updateAlbumFolderTableView(datas: Array<PHFetchResult<PHAssetCollection>>) {
        
        self.folderDatas = datas
        
        self.hbs_reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         
        return self.folderDatas.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.folderDatas[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withClass: MSAlbumFolderTableViewCell.self)
        cell.selectionStyle = .none
        cell.updateAlbumFolderCell(assetCollection: self.folderDatas[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.hbs_sendViewEventDelegate(hbs_eventObject: HBSViewEventObject.hbs_viewEvent(hbs_eventType: "更新相片列表", hbs_params: self.folderDatas[indexPath.section][indexPath.row]))
    }
}
