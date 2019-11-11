//
//  HomeMainListView.swift
//  FoodRecipe
//
//  Created by Bingo on 2019/11/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class HomeMainListView: UIView {

    let mainCellIdentifier = "UICollectionViewCellID"
    let mainHeaderIdentifier = "headviewID"
    let cellWidth = HomeListModel.defaultCellWidth
    
    private var mainHeadView = UIView()

    
    lazy var dataSource: [HomeListModel] = {
        
        return HomeListModel.testDatas()
    }()

    lazy var layout: WaterfallLayout = {
        let layout = WaterfallLayout.init()
        
        layout.delegate = self
        layout.minimumLineSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 20, bottom: 10, right: 20)
        layout.headerHeight = self.mainHeadView.height
        
        return layout
    }()
    
    
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        
        collectionView.register(HomeMainCollectionViewCell.self, forCellWithReuseIdentifier: mainCellIdentifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: mainHeaderIdentifier)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionView.frame = self.bounds

    }
    
    func configView(headView:UIView) {
        self.mainHeadView = headView
        self.addSubview(self.collectionView)
    }
    
}

// FR_ClickDelegate
extension HomeMainListView :FR_ClickDelegate{
    
    func fr_clickViewWithTypeDelegte(type: rf_clickViewType) {
        if type == .homeMessage {
            print("点击消息")
        }
        else if type == .homeSearchView{
            print("点击搜索")
        }
    }
}

extension HomeMainListView: WaterfallLayoutDelegate {
    
    func collectionViewLayout(for section: Int) -> WaterfallLayout.Layout {
        
        return .waterfall(column: 2, distributionMethod: .balanced)
//        return .flow(column: 2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let model = self.dataSource[indexPath.row]
        let itemH = model.contentHeight() + model.textContentHeight() + (1 * HomeListModel.defaultCellTitleSpace) + HomeListModel.defaultCellBottomHeight
        let itemSize = CGSize.init(width: cellWidth , height:  itemH)
        
        print("model-title\(model.title)")
        print("model-title\(itemH)")
        return itemSize
    }
    
}

extension HomeMainListView: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = self.dataSource[indexPath.row]
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: mainCellIdentifier, for: indexPath) as! HomeMainCollectionViewCell
        cell.updateModel(model: model)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var headerView = UICollectionReusableView()
        
        if kind == UICollectionView.elementKindSectionHeader{
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: mainHeaderIdentifier, for: indexPath) as UICollectionReusableView
            headerView.addSubview(self.mainHeadView)
        }
        
        return headerView
        
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: SCREEN_WIDTH, height: self.mainHeadView.height)
    }
}



