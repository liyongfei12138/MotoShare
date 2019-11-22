//
//  ContactManageViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/15.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import ContactsUI


 enum ContactManageType: Int  {
    case edit = 20000
    case add = 200001
    case other = 200002
}

class ContactManageViewController: BaseViewController {

    var type:ContactManageType = .other
    
    var rowPhone :String = ""
    var rowName :String = ""
    lazy var listView: UITableView = {
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

        // Do any additional setup after loading the view.
        if type == .edit {
             self.title = "管理联系人"
        }else{
            self.title = "添加联系人"
        }
        
        self.view.backgroundColor = ColorTableViewBG
        self.view.addSubview(self.listView)
        
        configLayout()
    }
    
    func configLayout()  {
        
        self.listView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    func clickAddressBook()  {
        let picker = CNContactPickerViewController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
    }
    
}

extension ContactManageViewController{
    convenience init(type:ContactManageType,info:Dictionary<String, Any>? = nil) {
        self.init()
        self.type = type
        
    }
}

extension ContactManageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
        return 2
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

       let cell:ManagerNunberTableViewCell = ManagerNunberTableViewCell.reusableCell(tableView: tableView) as! ManagerNunberTableViewCell
        cell.clickAddressBlock = {
            self.clickAddressBook()
        }
        if indexPath.row == 0{
            cell.configData(title: self.rowPhone, type: .phone)
        }else{
            cell.configData(title: self.rowName, type: .name)
        }
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 100))
        
        let deleteBtn = UIButton(type: .custom)
        deleteBtn.frame = CGRect(x: 0, y: 20, width: SCREEN_WIDTH, height:50)
        deleteBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        deleteBtn.setTitle("删除紧急联系人", for: .normal)
        deleteBtn.backgroundColor = ColorWhite
        deleteBtn.setTitleColor(UIColor.gl_hex(hex: 0xEE301E), for: .normal)
        footView.addSubview(deleteBtn)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: deleteBtn.frame.maxY + 5, width: SCREEN_WIDTH, height: 20))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.gl_hex(hex: 0x999999)
        titleLabel.text = "添加或修改紧急联系人后请及时通知对方"
        footView.addSubview(titleLabel)
        
        
        return footView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
        return  UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if type == .edit {
            return 100
        }
        else{
             return CGFloat.leastNormalMagnitude
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
extension ContactManageViewController:CNContactPickerDelegate{
//单选联系人
func contactPicker(_ picker: CNContactPickerViewController,
                   didSelect contact: CNContact) {
    //获取联系人的姓名
    let  firstName  :String = contact.familyName
    let lastName :String = contact.givenName
    
    let name = firstName + lastName
    print("选中人的名：\(name)")
     

    let phones = contact.phoneNumbers
    let phoneValue :String = phones.first?.value.stringValue ?? ""
    self.rowName = name
    self.rowPhone = phoneValue
    
    self.listView.reloadData()
    
    }
}