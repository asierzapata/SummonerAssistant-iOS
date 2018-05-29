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
    struct cs {
        var average: Int
        var perMin: Int
    }
    struct KDA {
        var kill: Int
        var death: Int
        var assist: Int
    }
    var winrate: String
    var gamesPlayer: String
}
