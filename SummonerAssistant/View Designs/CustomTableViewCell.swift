//
//  CustomTableViewCell.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 30/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var KDA: UILabel!
    @IBOutlet weak var ChampionAvatar: UIImageView!
    @IBOutlet weak var CS: UILabel!
    @IBOutlet weak var MatchContainer: RoundUIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
