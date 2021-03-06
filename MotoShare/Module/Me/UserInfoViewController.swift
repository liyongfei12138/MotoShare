//
//  UserInfoViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/26.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import JXPhotoBrowser
class UserInfoViewController: BaseUserInfoViewController {

    private lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .grouped)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorTableViewBG
        listView.separatorStyle = .none
        listView.bounces = false
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "个人信息"
        self.view.backgroundColor = ColorTableViewBG
        
        self.view.addSubview(self.listView)

        configLayout()
    }
    override func obbserverUserInfoChange(){
         self.listView.reloadData()
    }
    func configLayout()  {
        self.listView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }

    
    private func selectHeadImage(){
        
        let selectVC = MSResourceManagerAlbumViewController()
        selectVC.maxNo = 1
        selectVC.choiceType = .image
        selectVC.delegate = self
        selectVC.modalPresentationStyle = .currentContext
        self.present(selectVC, animated: true, completion: nil)

    }


}

extension UserInfoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      let dataArr = MeModel.getUserInfoListData()
        return dataArr[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        let dataArr = MeModel.getUserInfoListData()
        return dataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataArr = MeModel.getUserInfoListData()
        let model = dataArr[indexPath.section][indexPath.row]
        let title =  model.title ?? ""
        let type =  model.type ?? .other
        let detail = model.detail ?? ""
        
        if type == .icon{
            let cell:UserInfoIconTableViewCell = UserInfoIconTableViewCell.reusableCell(tableView: tableView) as! UserInfoIconTableViewCell
            cell.configData(title: title, detail: detail)
            return cell
        }
        else{
            let cell:UserUidTableViewCell = UserUidTableViewCell.reusableCell(tableView: tableView) as! UserUidTableViewCell
            cell.configData(title: title, detail: detail,type:type)
            return cell
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataArr = MeModel.getUserInfoListData()
        let model = dataArr[indexPath.section][indexPath.row]
        let type =  model.type
        switch type {
        case .icon:
            self.selectHeadImage()
        break
        case .name:
            let changeNameVc = ChangeNameViewController()
            self.present(BaseNavigationController(rootViewController: changeNameVc), animated: true, completion: nil)
        break
        case .position:
            let changeVc = ChangeOtherViewController(type: .position)
            self.present(BaseNavigationController(rootViewController: changeVc), animated: true, completion: nil)
        break
        case .introduce:
            let changeVc = ChangeOtherViewController(type: .introduce)
            self.present(BaseNavigationController(rootViewController: changeVc), animated: true, completion: nil)
        break
        case .sex:
            let changeSex = ChangeSexViewController()
            self.present(BaseNavigationController(rootViewController: changeSex), animated: true, completion: nil)
        break
        case .picture:
            let pictureVC = PhotoAlbumViewController()
            self.present(BaseNavigationController(rootViewController: pictureVC), animated: true, completion: nil)
        break
            
        default:
        break
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dataArr = MeModel.getUserInfoListData()
        let model = dataArr[indexPath.section][indexPath.row]
        let type =  model.type
        
        if type == .icon{
            return 70
        }
        else{
            return 50
        }
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 20))
        footView.backgroundColor = ColorTableViewBG
        
        return footView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return  UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 10
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}

extension UserInfoViewController: MSResourceManagerViewControllerDelegate{
    
    func imageChoiceFinish(assets: [MSPHAsset]) {
        
        let image = assets.first?.thumbnailImage ?? UIImage()
        
        UpLoadImage.upLoadImage(img: image, fileName: Date().milliStamp.md5, success: { (respond, info) in
            
            let image:String =  info?["url"] as! String
            let imageUrl = "http://imageym.yunmolife.cn/" + image
            
            
            MeRequestModel.changeWithInfo(info: imageUrl,type:.headimg, { (data) in
                self.listView.reloadData()
            })
            
        }) {
            HUDBase.showTitle(title: "上传图片失败")
        }
    }
}

