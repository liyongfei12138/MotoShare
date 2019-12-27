//
//  CountDownManager.swift
//  MotoShare
//
//  Created by walker on 2019/12/24.
//  Copyright © 2019 Bingo. All rights reserved.
//

import Foundation
import Schedule

class CountDownManager: NSObject {
    
    // MARK: 单例
    static let stand = CountDownManager()
    private override init(){}
    
    var taskDict: [String: Task] = [String: Task]()
    
    // 开始计时
    func beginCountDown(identifier: String = "countDown", interval: TimeInterval, progress: @escaping((_ identifier: String, _ remainderInterval: TimeInterval, _ endDate: Date)->()), endAction: @escaping((_ identifier: String)->())) {
        
        var untilDate = Date.init(timeIntervalSinceNow: interval)
        
        let oldInterval = countDownUntilInterval(identifier: identifier)
        
        if oldInterval != 0 {
            
            untilDate = Date.init(timeIntervalSince1970: oldInterval)
        }
        
        UserDefaults.standard.set(untilDate.timeIntervalSince1970, forKey: countDownIdentier(identifier: identifier))
        UserDefaults.standard.synchronize()
        
        let plan: Plan = Plan.every(1.second).until(untilDate)

        let task = plan.do {(tmpTask) in
            
            let remainder = untilDate.timeIntervalSinceNow

            progress(identifier, remainder.abs, untilDate)
            
            if remainder < 1.0 {
                endAction(identifier)
                self.removeCountDown(identifier: self.countDownIdentier(identifier: identifier))
            }
        }
        
        self.taskDict.updateValue(task, forKey: countDownIdentier(identifier: identifier))
        task.executeNow()
    }
    
    // 倒计时结束时的 Interval
    func countDownUntilInterval(identifier: String) -> TimeInterval {
        
        var interval = UserDefaults.standard.double(forKey: countDownIdentier(identifier: identifier))
        
        let currentInterval = Date().timeIntervalSince1970
        
        
        if currentInterval > interval {
            // 倒计时已过期
            self.removeCountDown(identifier: countDownIdentier(identifier: identifier))

            interval = 0
        }
        
        return interval
    }
    
    // 移除倒计时
    func removeCountDown(identifier: String) {
        
        let task = self.taskDict[countDownIdentier(identifier: identifier)]
        
        if task != nil {
            task?.cancel()
            self.taskDict.removeValue(forKey: countDownIdentier(identifier: identifier))
        }
        
        UserDefaults.standard.removeObject(forKey: countDownIdentier(identifier: identifier))
        UserDefaults.standard.synchronize()
    }
    
    // 对identifier 进行处理
    func countDownIdentier(identifier: String) -> String {
        
        if identifier.contains("motoShare.countDown.identifier_") {
            return identifier
        }
        
        return "motoShare.countDown.identifier_" + identifier
    }
    
}
