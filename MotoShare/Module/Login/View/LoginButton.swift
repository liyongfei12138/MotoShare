//
//  LoginButton.swift
//  MotoShare
//
//  Created by Bingo on 2019/11/21.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Pastel
class LoginButton: UIButton {

    func beginLogin() {
        
        self.hbs_showIndicator(type: .ballRotateChase, color: ColorWhite,  padding: 40)
        self.isUserInteractionEnabled = false
        self.setTitle("", for: .normal)
//        self.hbs_showIndicator()
    }
    func endLogin() {
        self.hbs_hideIndicator()
        self.isUserInteractionEnabled = true
        self.setTitle("登录", for: .normal)
    }
}

extension LoginButton{
    convenience init(title:String,size:CGSize) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(ColorWhite, for: .normal )
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        
        let pastelView = PastelView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        pastelView.animationDuration = 3.0

        pastelView.setColors([
                            ColorTheme,
                            UIColor.gl_hex(hex: 0xFFEFD5),
                            UIColor.gl_hex(hex: 0xFFD700),
                            UIColor.gl_hex(hex: 0xFFA500)
                            ])

        pastelView.startAnimation()
        self.insertSubview(pastelView, at: 0)
        
        
        
    }
}
