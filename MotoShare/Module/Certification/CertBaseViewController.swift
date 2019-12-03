//
//  CertBaseViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/12/3.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import CDAlertView
class CertBaseViewController: UIViewController {

    var dataArr: [CertBaseModel]? = [CertBaseModel]()
    
    private var index :Int? = 0
    
    
    
    private lazy var upBtn: UIButton = {
        let upBtn = UIButton(type: .custom)
        upBtn.backgroundColor = ColorTheme
        upBtn.setTitle("提交申请", for: .normal)
        upBtn.setTitleColor(ColorWhite, for: .normal)
        upBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        upBtn.addTarget(self, action: #selector(clickUpLoadBtn), for: .touchUpInside)
        return upBtn
    }()
    

    private lazy var listView: UITableView = {
        let listView = UITableView (frame: .zero, style: .plain)
        listView.delegate = self
        listView.dataSource = self
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = false
        listView.backgroundColor = ColorTableViewBG
        listView.separatorStyle = .none
        listView.bounces = false
        return listView
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "身份证认证"
        self.view.backgroundColor = ColorTableViewBG
        self.view.addSubview(self.upBtn)
        self.view.addSubview(self.listView)
        configLayout()
    }
    
    @objc private func clickUpLoadBtn(){
        let alert = CDAlertView(title: "提交申请", message: "为了确保您的审核进度，请使用本人信息进行提交", type: .warning)
        let doneAction = CDAlertViewAction(title:  "提交", textColor: ColorTheme) { (action) -> Bool in

            self.uploadInfo()
            
            return true
        }
        alert.add(action: doneAction)
        let nevermindAction = CDAlertViewAction(title: "取消", textColor: UIColor.gl_hex(hex: 0x999999))
        alert.add(action: nevermindAction)
        alert.show()
    }
    
    func uploadInfo()  {
        
    }
    
    private func configLayout()  {

        self.upBtn.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        self.listView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.upBtn.snp.top)
            make.top.left.right.equalToSuperview()
        }
    }
}
extension CertBaseViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return self.dataArr?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let model = self.dataArr?[indexPath.row] ?? CertBaseModel.init(image: UIImage(), type: .other, detail: "")
        
        let img =  model.image!
        let type = model.type!
        let detail = model.detail!
        
        
       let cell:CertiTableViewCell = CertiTableViewCell.reusableCell(tableView: tableView) as! CertiTableViewCell
        
        
        cell.congfigData(image: img, type: type, detail:detail)
        cell.selectBlock = {  (type) in
            
            self.index = indexPath.row
            let selectVC = MSResourceManagerAlbumViewController()
            selectVC.maxNo = 1
            selectVC.delegate = self
            selectVC.choiceType = .image
            selectVC.modalPresentationStyle = .currentContext
            self.present(selectVC, animated: true, completion: nil)
            
            
        }
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return SCREEN_WIDTH * 0.7 * 0.64 + 40
    }

}
extension  CertBaseViewController :MSResourceManagerViewControllerDelegate{
    
    func imageChoiceFinish(assets: [MSPHAsset]) {
        
        let image = assets.first?.thumbnailImage ?? UIImage()
        
        var model = self.dataArr?[self.index!] ?? CertBaseModel.init(image: UIImage(), type: .other, detail: "")
        let type = model.type!
        let detail = model.detail!
        
        
        model = CertBaseModel.init(image: image, type: type, detail: detail)
        
        self.dataArr![self.index!] = model
        self.listView.reloadData()
    }
    
    
}
