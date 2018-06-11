//
//  AppStateController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation

class AppStateController {
    var summoner : SummonerInfo = SummonerInfo(dictionary: ["accountId": 0, "id": 0, "name": "", "profileIconId": 1, "profileIconThumbnail" : "https://opgg-static.akamaized.net/images/lol/champion/Tristana.png?image=w_45&v=1", "summonerLevel" : 1])
    var mostFrequentChampionsArray : Array<ChampionsStatisticsModel> = []
    var matchList : Array<MatchInfoModel> = []
    var season : String = "7"
    
    init(summoner: SummonerInfo, mostFrequentChampionsArray: Array<ChampionsStatisticsModel>, matchList : Array<MatchInfoModel>) {
        self.summoner = summoner
        self.mostFrequentChampionsArray = mostFrequentChampionsArray
        self.matchList = matchList
    }
    
    init() {
        
    }

}
