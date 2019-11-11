//
//  BaseTableView.swift
//  Pretty
//
//  Created by Ghostlord on 2019/9/25.
//  Copyright © 2019 ghostlord. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift       // 无数据占位图

class BaseTableView: UITableView, EmptyDataSetSource, EmptyDataSetDelegate {
    
    //MARK: ----------- EmptyViewConfig
    var emptyConfig: EmptyConfig = EmptyConfig.init(configType: .defalut)
    
    var _____gl_isLoading: Bool = false
    
    public var emptyEnable: Bool = false {
        
        didSet{
            
            if emptyEnable == true && oldValue == false {
                
                self.emptyDataSetDelegate = self
                self.emptyDataSetSource = self
            }else if emptyEnable == false && oldValue == true {
                
                self.emptyDataSetDelegate = nil
                self.emptyDataSetSource = nil
            }
        }
    }
    
    // DZNEmptyDataSetSource
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return self.emptyConfig.titleString
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return self.emptyConfig.detailString
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return self.emptyConfig.image
    }
    
    func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? {
        return self.emptyConfig.imageAnimation
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        return self.emptyConfig.buttonTitle(state)
    }
    
    func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> UIImage? {
        return self.emptyConfig.buttonBackgroundImage(state)
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return self.emptyConfig.backgroundColor
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        return self.emptyConfig.verticalOffset
    }
    
    func spaceHeight(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        return self.emptyConfig.spaceHeight
    }
    
    // DZNEmptyDataSetDelegate Methods
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView) -> Bool {
        return false
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        self._____gl_isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.self._____gl_isLoading = false
        }
    }
    
    func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
        self._____gl_isLoading = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.self._____gl_isLoading = false
        }
    }
}


/// 无数据占位图配置类
open class EmptyConfig {
    
    enum EmptyConfigType {
        case defalut
        case marketList
        case favList
        case discuss
    }
    
    var configType: EmptyConfigType! = .defalut
    
    convenience init(configType: EmptyConfigType = .defalut) {
        
        self.init()
        self.configType = configType
    }
    
    
    /// 标题
    var titleString: NSAttributedString? {
        
        var text: String! = "暂无数据"
        var font: UIFont! = UIFont.systemFont(ofSize: 17)
        var textColor: UIColor! = UIColor.gray
        
        switch self.configType! {
        case .defalut:
            text = "暂无数据"
        case .marketList:
            text = ""
        case .favList:
            text = "暂无收藏"
        case .discuss:
            text = "暂无数据"
        default:
            break
        }
        
        if text == nil {
            return nil
        }
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        if font != nil {
            attributes[NSAttributedString.Key.font] = font!
        }
        
        if textColor != nil {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    /// 详情信息
    var detailString: NSAttributedString? {
        var text: String! = "请检查网络并重试"
        var font: UIFont! = UIFont.systemFont(ofSize: 12)
        var textColor: UIColor! = UIColor.lightGray
        
        switch self.configType! {
        case .defalut:
            text = "请检查网络并重试"
        case .marketList:
            text = "暂无产品"
        case .favList:
            text = ""
        case .discuss:
            text = ""
            
        default:
            break
        }
        
        if text == nil {
            return nil
        }
        var attributes: [NSAttributedString.Key: Any] = [:]
        if font != nil {
            attributes[NSAttributedString.Key.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    /// 图片
    var image: UIImage? {
        let imageNamed = "icon_noData"
        return UIImage.init(named: imageNamed)
    }
    
    
    /// 动画样式
    var imageAnimation: CAAnimation? {
        let animation = CABasicAnimation.init(keyPath: "transform")
        animation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi/2, 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        
        return animation;
    }
    
    
    /// 按钮标题
    ///
    /// - Parameter state: 状态
    func buttonTitle(_ state: UIControl.State) -> NSAttributedString? {
        var text: String! = "点击重试"
        var font: UIFont! = UIFont.boldSystemFont(ofSize: 17)
        var textColor: UIColor! = UIColor.black
        
        switch self.configType! {
        case .defalut:
            text = "点击重试"
        case .marketList:
            text = nil
        case .favList:
            text = nil
            
        default:
            break
        }
        
        if text == nil {
            return nil
        }
        var attributes: [NSAttributedString.Key: Any] = [:]
        if font != nil {
            attributes[NSAttributedString.Key.font] = font!
        }
        if textColor != nil {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    /// 按钮的背景图片
    ///
    /// - Parameter state: 状态
    func buttonBackgroundImage(_ state: UIControl.State) -> UIImage? {
        var imageName = "button_background".lowercased()
        
        if state == .normal {
            imageName = imageName + "_normal"
        }
        if state == .highlighted {
            imageName = imageName + "_highlight"
        }
        
        var capInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        var rectInsets = UIEdgeInsets.zero
        
        switch self.configType! {
        case .defalut:
            capInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            rectInsets = UIEdgeInsets.zero
        case .marketList:
            capInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            rectInsets = UIEdgeInsets.zero
        case .favList:
            capInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            rectInsets = UIEdgeInsets.zero
            
        default:
            break
        }
        
        let image = UIImage.init(named: imageName)
        
        return image?.resizableImage(withCapInsets: capInsets, resizingMode: .stretch).withAlignmentRectInsets(rectInsets)
    }
    
    
    /// 背景颜色
    var backgroundColor: UIColor? {
        
        return .white
        
    }
    
    // 整体向下的偏移量
    var verticalOffset: CGFloat {
        switch self.configType! {
        case .defalut:
            
            return 0
        case .marketList:
            
            return -50
            
        case .favList:
            return -50
            
        default:
            return 0
        }
    }
    
    /// 占位图和文字间距
    var spaceHeight: CGFloat {
        switch self.configType! {
        case .defalut:
            
            return 0
        case .marketList:
            
            return 40
            
        case .favList:
            return 40
            
        default:
            return 0
        }
    }
}
