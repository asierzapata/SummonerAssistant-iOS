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
    var cs: Int
    var gold: Int
    var averageDamageDealt: Int
    var averageDamageTaken: Int
    var maxKills: Int
    var maxDeaths: Int
    var doubleKill: Int
    var tripleKill: Int
    var quadraKill: Int
    var pentaKill: Int
    var kills: Double
    var deaths: Double
    var assists: Double
    var average: Double
    var winrate: Int
    var gamesPlayed: Int
    var gamesWon: Int
    var gamesLost: Int
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as! String
        let sanitizedURL = (dictionary["thumbnailUrl"] as! String).components(separatedBy: "\'")
        let thumbnail = sanitizedURL.joined(separator: "").components(separatedBy: "://")
        self.thumbnailUrl = "https://\(thumbnail[1])"
        self.cs = dictionary["cs"] as! Int
        self.gold = dictionary["gold"] as! Int
        self.averageDamageDealt = dictionary["averageDamageDealt"] as! Int
        self.averageDamageTaken = dictionary["averageDamageTaken"] as! Int
        self.maxKills = dictionary["maxKills"] as! Int
        self.maxDeaths = dictionary["maxDeaths"] as! Int
        self.doubleKill = dictionary["doubleKill"] as! Int
        self.tripleKill = dictionary["tripleKill"] as! Int
        self.quadraKill = dictionary["quadraKill"] as! Int
        self.pentaKill = dictionary["pentaKill"] as! Int
        let KDA = dictionary["KDA"] as! Dictionary<String,AnyObject>
        self.kills = KDA["kills"] as! Double
        self.deaths = KDA["deaths"] as! Double
        self.assists = KDA["assists"] as! Double
        self.average = KDA["average"] as! Double
        let games = dictionary["games"] as! Dictionary<String,AnyObject>
        self.winrate = games["winrate"] as! Int
        self.gamesPlayed = games["played"] as! Int
        self.gamesWon = games["wins"] as! Int
        self.gamesLost = games["losses"] as! Int
    }
}
