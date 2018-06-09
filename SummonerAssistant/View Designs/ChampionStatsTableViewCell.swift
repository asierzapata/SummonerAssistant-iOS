//
//  ChampionStatsTableViewCell.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 08/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

class ChampionStatsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ChampionAvatar: RoundedImageView!
    @IBOutlet weak var ChampionName: UILabel!
    @IBOutlet weak var WinRate: UILabel!
    @IBOutlet weak var KDARaw: UILabel!
    @IBOutlet weak var KDAAvg: UILabel!
    @IBOutlet weak var WinRateBar: RoundUIView!
    @IBOutlet weak var WinBarWidth: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
