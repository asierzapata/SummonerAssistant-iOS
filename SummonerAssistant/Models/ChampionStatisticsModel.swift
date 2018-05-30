//
//  ChampionsModel.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation
import UIKit

struct ChampionsStatisticsModel: Codable{
    var name: String
    var thumbnailUrl: String?
    var csAverage: Int
    var csPerMin: Int
    var kill: Int
    var death: Int
    var assist: Int
    var winrate: String
    var gamesPlayer: String
    
//    init(dictionary: [String: Any]) {
//        self.name = dictionary["name"] as! String
//        self.thumbnailUrl = dictionary["thumbnailUrl"] as? String
//        self.csAverage = dictionary["cs"]!["average"] as! Int
//        self.csPerMin = dictionary["cs"]!["perMin"] as! Int
//        self.kill = dictionary["KDA"]["kill"] as! Int
//        self.death = dictionary["KDA"]["death"] as! Int
//        self.assist = dictionary["KDA"]["assist"] as! Int
//        self.winrate = dictionary["winrate"] as! String
//        self.gamesPlayer = dictionary["gamesPlayer"] as! String
//    }
}
