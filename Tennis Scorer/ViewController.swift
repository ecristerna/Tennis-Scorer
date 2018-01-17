//
//  ViewController.swift
//  Tennis Scorer
//
//  Created by Eduardo Cristerna on 15/01/18.
//  Copyright © 2018 Eduardo Cristerna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        HistoryManager.saveHistoryEntry([
            "PlayerAName": "Eduardo",
            "PlayerBName": "Luis",
            "PlayerASetScores": [6, 4, 6, 7],
            "PlayerBSetScores": [3, 6, 4, 5],
            "PlayerADidWin": true
            ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if (segue.identifier == "ShowHistory") {
            let historyTableVC = (segue.destination as! UINavigationController).topViewController as! HistoryTableViewController
            historyTableVC.history = HistoryManager.getHistory()
        }
    }

}
