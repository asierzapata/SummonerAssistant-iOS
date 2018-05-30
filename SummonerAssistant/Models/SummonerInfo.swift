//
//  SummonerInfo.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 30/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation

struct SummonerInfo {
    var accountId: Int
    var id: Int
    var name: String
    var profileIconId: Int
    var profileIconThumbnail: String
    var summonerLevel: Int
    init(dictionary: [String: Any]) {
        self.accountId = dictionary["accountId"] as! Int
        self.id = dictionary["id"] as! Int
        self.name = dictionary["name"] as! String
        self.profileIconId = dictionary["profileIconId"] as! Int
        self.profileIconThumbnail = dictionary["profileIconThumbnail"] as! String
        self.summonerLevel = dictionary["summonerLevel"] as! Int
    }
}
