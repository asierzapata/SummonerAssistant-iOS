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
    var thumbnailUrl: String
    var cs: String
    var gold: String
    var averageDamageDealt: String
    var averageDamageTaken: String
    var maxKills: String
    var maxDeaths: String
    var doubleKill: String
    var tripleKill: String
    var quadraKill: String
    var pentaKill: String
    var kill: Double
    var death: Double
    var assist: Double
    var winrate: String
    var gamesPlayed: String
    var gamesWon: String
    var gamesLost: String
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as! String
        self.thumbnailUrl = dictionary["thumbnailUrl"] as! String
        self.cs = dictionary["cs"] as! String
        self.gold = dictionary["gold"] as! String
        self.averageDamageDealt = dictionary["averageDamageDealt"] as! String
        self.averageDamageTaken = dictionary["averageDamageTaken"] as! String
        self.maxKills = dictionary["maxKills"] as! String
        self.maxDeaths = dictionary["maxDeaths"] as! String
        self.doubleKill = dictionary["doubleKill"] as! String
        self.tripleKill = dictionary["tripleKill"] as! String
        self.quadraKill = dictionary["quadraKill"] as! String
        self.pentaKill = dictionary["pentaKill"] as! String
        let KDA = dictionary["KDA"] as! Dictionary<String,AnyObject>
        self.kill = KDA["kill"] as! Double
        self.death = KDA["death"] as! Double
        self.assist = KDA["assist"] as! Double
        let games = dictionary["games"] as! Dictionary<String,AnyObject>
        self.winrate = games["winrate"] as! String
        self.gamesPlayed = games["played"] as! String
        self.gamesWon = games["wins"] as! String
        self.gamesLost = games["losses"] as! String
    }
}
