//
//  HistoryManager.swift
//  Tennis Scorer
//
//  Created by Eduardo Cristerna on 16/01/18.
//  Copyright © 2018 Eduardo Cristerna. All rights reserved.
//

import Foundation

class HistoryManager: NSObject {
    
    static private func filePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return "\(paths.first ?? "")/History.plist"
    }
    
    static func getHistory() -> [[String:Any]] {
        let filePath = HistoryManager.filePath()
        let data = NSArray.init(contentsOfFile: filePath)
        
        return (data as? [[String:Any]]) ?? []
    }
    
    static func saveHistory(_ history: [[String:Any]]) {
        let filePath = HistoryManager.filePath()
        (history as NSArray).write(toFile: filePath, atomically: true)
    }
    
    static func saveHistoryEntry(_ entry: [String:Any]) {
        var history = HistoryManager.getHistory()
        history.append(entry)
        HistoryManager.saveHistory(history)
    }
    
}
