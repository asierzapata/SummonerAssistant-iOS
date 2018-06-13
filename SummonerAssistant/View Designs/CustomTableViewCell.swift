//
//  CustomTableViewCell.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 30/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // Match container
    @IBOutlet weak var MatchContainer: RoundUIView!
    
    // Images + Labels of champion
    @IBOutlet weak var ChampionAvatar: UIImageView!
    @IBOutlet weak var FirstSummoner: UIImageView!
    @IBOutlet weak var SecondSummoner: UIImageView!
    @IBOutlet weak var MainRune: UIImageView!
    @IBOutlet weak var SecondRune: UIImageView!
    @IBOutlet weak var ChampionLevel: UILabel!
    
    // Game information
    @IBOutlet weak var MatchType: UILabel!
    @IBOutlet weak var TimeCreated: UILabel!
    @IBOutlet weak var TotalTime: UILabel!
    @IBOutlet weak var KillStreak: UILabel!
    
    // Game stats
    @IBOutlet weak var MMR: UILabel!
    @IBOutlet weak var KDAString: UILabel!
    @IBOutlet weak var KDAAverage: UILabel!
    @IBOutlet weak var CS: UILabel!
    @IBOutlet weak var KillParticipation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
