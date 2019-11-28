//
//  PhotoAlbumViewController.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/28.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class PhotoAlbumViewController: BaseChangeViewController {

    private let IDENTIFIER = "CELl_REUSE_ID"
    private lazy var photoBtn: UIButton = {
        let photoBtn = UIButton(type: .custom)
        photoBtn.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        photoBtn.setImage(UIImage(named: "change_photoalbum"), for: .normal)
        photoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
//        photoBtn.addTarget(self, action: #selector(done), for: .touchUpInside)
        return photoBtn
    }()
    
    lazy var dataArr: [Dictionary<String,Any>] = {
        let dataArr = [Dictionary<String,Any>]()
        return dataArr
    }()
    lazy var collectionView: UICollectionView = {
        let layout = WaterflowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumColumnSpacing = 10
        layout.minimumInneritemSpacing = 10
        layout.columnCount = 2
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: IDENTIFIER)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = ColorTableViewBG
        return view
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.photoBtn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "相册"
        self.view.addSubview(self.collectionView)
        configLayout()
        getData()
    }
    private func configLayout()  {
        self.collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.right.bottom.equalToSuperview()
        }
    }
    func getData()  {
        self.view.hbs_showIndicator(type: .ballRotateChase, color: ColorTheme, padding: 50)
        TestRequest.getTestData(key: TestRequest.key.Photo, { (data) in
            print(data)
            
            self.dataArr = data["photos"] as! [Dictionary<String, Any>]
            self.view.hbs_hideIndicator()
            self.collectionView.reloadData()
        }) {
            self.view.hbs_hideIndicator()
        }
    }
    
}
extension PhotoAlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = PhotosBaseModel.deserialize(from: self.dataArr[indexPath.row])
         let cell:PhotosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTIFIER, for: indexPath) as! PhotosCollectionViewCell
//        cell.backgroundColor = .randomColor
        cell.configData(urlString: model?.photo ?? "")
        return cell
    }
    


}

// WaterflowViewDelegate
extension PhotoAlbumViewController: WaterflowViewDelegate {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        let model = PhotosBaseModel.deserialize(from: self.dataArr[indexPath.row])
        
        let width = (SCREEN_WIDTH - 30) / 2
        let height = width.float * (model?.height.float ?? 0.0) / (model?.width.float ?? 0.0)
        
        return CGSize(width: width, height: CGFloat(height))
    }
    
}
