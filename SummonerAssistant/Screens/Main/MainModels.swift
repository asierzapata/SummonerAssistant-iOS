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
            struct MostUsedChampions {
                var summonerName: String
                var region: String
                var season: String
            }
            struct SummonerInfo {
                var summonerName: String
                var region: String
            }
            struct MatchInfoView {
                var region: String
                var summonerName: String
                var type: String
                var start: String
            }
        }
        struct Response{
            var message: String?
            var isError: Bool
            var data: Any
        }
        struct ViewModel{
            struct MostUsedChampions {
                var topUsedChampions: Array<ChampionsStatisticsModel>
                var isError: Bool
                var message: String?
            }
            struct SummonerInfoView {
                var info: SummonerInfo
                var isError: Bool
                var message: String?
            }
            struct MatchInfoView {
                var matchList: Array<MatchInfoModel>
                var isError: Bool
                var message: String?
            }
        }
    }
}
