//
//  MatchInfoModel.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation

struct MatchInfoModel {
    
    var gameId: Int
    var summonerId: Int
    var timeCreated: Int
    var gameType: String
    var mmr: Int
    var isRemake: Int
    var isWin: Int
    var items: Array<AnyObject>
    var gameLength: Int
    var firstRune: String
    var secondRune: String
    var spells: Array<AnyObject>
    var gameStats : stats
    var championData: champion
    struct stats {
        var killContribution: String
        var cs: Int
        var csPerMin: Int
        var deaths: Int
        var assists: Int
        var kills: Int
        var goldEarned: Int
        var KDA: String
        var largestMultiKillString: String?
        var totalDamageDealtToChampions: Int
        var sightWardsBought: Int
        var visionWardsBought: Int
    }
    struct champion {
        var imageUrl: String
        var level: Int
    }
    
    init(dictionary: [String: Any]) {
        self.gameId = dictionary["gameId"] as! Int
        self.summonerId = dictionary["summonerId"] as! Int
        self.timeCreated = dictionary["timeCreated"] as! Int
        self.gameType = dictionary["gameType"] as! String
        self.mmr = dictionary["mmr"] as! Int
        self.isRemake = dictionary["isRemake"] as! Int
        self.isWin = dictionary["isWin"] as! Int
        self.items = dictionary["items"] as! Array<AnyObject>
        self.gameLength = dictionary["gameLength"] as! Int
        let statsArray = dictionary["stats"] as! Dictionary<String,AnyObject>
        let general = statsArray["general"] as! Dictionary<String,AnyObject>
        let ward = statsArray["ward"] as! Dictionary<String,AnyObject>
        self.gameStats = stats(
            killContribution: general["contributionForKillRate"] as! String,
            cs: general["cs"] as! Int,
            csPerMin: general["csPerMin"] as! Int,
            deaths: general["death"] as! Int,
            assists: general["assist"] as! Int,
            kills: general["kill"] as! Int,
            goldEarned: general["goldEarned"] as! Int,
            KDA: general["kdaString"] as! String,
            largestMultiKillString: general["largestMultiKillString"] as? String,
            totalDamageDealtToChampions: general["totalDamageDealtToChampions"] as! Int,
            sightWardsBought: ward["sightWardsBought"] as! Int,
            visionWardsBought: ward["visionWardsBought"] as! Int)
        let runes = dictionary["perk"] as! Array<String>
        self.firstRune = runes[0] as String
        self.secondRune = runes[1] as String
        self.spells = dictionary["spells"] as! Array<AnyObject>
        let championObject = dictionary["champion"] as! Dictionary<String,AnyObject>
        self.championData = champion(imageUrl: championObject["imageUrl"] as! String, level: championObject["level"] as! Int)
    }
}
