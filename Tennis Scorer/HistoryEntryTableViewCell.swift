//
//  HistoryEntryTableViewCell.swift
//  Tennis Scorer
//
//  Created by Eduardo Cristerna on 16/01/18.
//  Copyright © 2018 Eduardo Cristerna. All rights reserved.
//

import UIKit

class HistoryEntryTableViewCell: UITableViewCell {

    @IBOutlet var PlayerALabel: UILabel!
    @IBOutlet var PlayerBLabel: UILabel!
    @IBOutlet var PlayerASetScoresCollection: [UILabel]!
    @IBOutlet var PlayerBSetScoresCollection: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cleanUp()
    }
    
    func cleanUp() {
        for i in 0..<self.PlayerASetScoresCollection.count {
            self.PlayerASetScoresCollection[i].isHidden = true
            self.PlayerBSetScoresCollection[i].isHidden = true
        }
    }
    
    func configureForHistoryEntry(_ entry: [String:Any]) {
        self.cleanUp()
        
        self.PlayerALabel.text = entry["PlayerAName"] as? String ?? "No Name"
        self.PlayerBLabel.text = entry["PlayerBName"] as? String ?? "No Name"
        
        let playerASetScores = entry["PlayerASetScores"] as? [Int] ?? []
        let playerBSetScores = entry["PlayerBSetScores"] as? [Int] ?? []
        
        for i in 0..<playerASetScores.count {
            self.PlayerASetScoresCollection[i].isHidden = false
            self.PlayerBSetScoresCollection[i].isHidden = false
            
            self.PlayerASetScoresCollection[i].text = "\(playerASetScores[i])"
            self.PlayerBSetScoresCollection[i].text = "\(playerBSetScores[i])"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
