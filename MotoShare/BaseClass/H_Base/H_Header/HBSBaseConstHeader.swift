//
//  HBSBaseConst.swift
//  HBS
//
//  Created by mac on 2019/10/21.
//  Copyright © 2019 hhl. All rights reserved.
//

import UIKit

/// 下拉刷新
let HBS_C_PULL_DOWN = "HBS_C_PULL_DOWN"
/// 上拉加载
let HBS_C_PULL_UP = "HBS_C_PULL_UP"
/// 刷新页面
let HBS_C_RELOAD_DATA = "HBS_C_RELOAD_DATA"

/// 屏幕宽度
let HBS_C_SCREEN_WIDTH = UIScreen.main.bounds.size.width
/// 屏幕高度
let HBS_C_SCREEN_HEIGHT = UIScreen.main.bounds.size.height
/// 状态栏高度
let HBS_C_STATUSBAR_HEIGHT = (HBSDevice.hbs_isFullScreen ? 44.0 : 20.0)
/// 状态栏+导航栏高度
let HBS_C_NAVIGATION_HEIGHT_ADD_STATUS_HEIGHT = CGFloat(HBS_C_STATUSBAR_HEIGHT + 44.0)
/// Tabbar高度
let HBS_C_TABBAR_HEIGHT = CGFloat(HBSDevice.hbs_isFullScreen ? 83.0 : 49.0)
/// HomeIndicator高度
let HBS_C_HOMEINDICATOR_HEIHGT = CGFloat(HBS_C_TABBAR_HEIGHT - 49.0)


/// 背景颜色
let HBS_C_BackgroundColor = UIColor.hbs_color(light: 0xf5f5f6, dark: 0x454545)
/// 主题色
let HBS_C_MainColor = UIColor.hbs_color(light: 0x0E6655, dark: 0xD45B4B)
/// 按钮背景色
let HBS_C_ButtonBacColor = UIColor.hbs_color(light: 0xF13D35, dark: 0xED8984)
/// 分割线颜色
let HBS_C_DividingLineColor = UIColor.hbs_color(light: 0xdddddd, dark: 0x999999)

