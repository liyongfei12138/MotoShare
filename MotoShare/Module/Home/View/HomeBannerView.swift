//
//  HomeBannerButton.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/12.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

public protocol BannerViewDelegate: class {
    // MARK: - Required
    
    func bannerDidSelectIndex(index:Int)
}

class HomeBannerView: UIView {
    
    let CellIdentifier = "yf_banner_cell"
    let ViewHeight = CGFloat(35)
    
    var titleArray : Array<String> = []
    var selectIndex : Int = 0
    
    weak var delegate : BannerViewDelegate?
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: SCREEN_WIDTH / 5, height: ViewHeight)
        layout.minimumLineSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }()
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.collectionView.frame = self.bounds
        self.addSubview(self.collectionView)
    }
    
    func configTitleData(titleArray:Array<String>) {
        
        self.titleArray = titleArray
        self.collectionView.reloadData()
    }
}
extension HomeBannerView: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! BannerCollectionViewCell
        
        let title = self.titleArray[indexPath.row]
        
        cell.configTitle(title:title)
        if indexPath.row == self.selectIndex{
            cell.configIsSelect(isSelect: true)
        }else{
            cell.configIsSelect(isSelect: false)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !(indexPath.row == self.selectIndex){
            self.selectIndex = indexPath.row
            self.collectionView.reloadData()
            self.delegate?.bannerDidSelectIndex(index: indexPath.row)
        }else{
            
        }
    }
}
