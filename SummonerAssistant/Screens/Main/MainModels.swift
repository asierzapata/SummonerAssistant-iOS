//
//  MainModels.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation

import UIKit

struct MainModel{
    struct Fetch {
        struct Request{
            var summonerName: String
            var region: String
            var season: String
        }
        struct Response{
            var message: String?
            var isError: Bool
            var data: Array<ChampionsStatisticsModel>
        }
        struct ViewModel{
            var topUsedChampions: Array<ChampionsStatisticsModel>
            var isError: Bool
            var message: String?
        }
    }
}
