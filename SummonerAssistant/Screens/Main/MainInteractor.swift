//
//  MainInteractor.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MainInteractorInput {
    func fetchTopChampionsSummoner(request: MainModel.Fetch.Request.MostUsedChampions)
    func fetchSummonerInfo(request: MainModel.Fetch.Request.SummonerInfo)
    func fetchMatchList(request: MainModel.Fetch.Request.MatchInfoView)
}

class MainInteractor: MainInteractorInput {
    
    var presenter: MainPresenterInput!
    var worker: MainWorker!
    
    
    func fetchTopChampionsSummoner(request: MainModel.Fetch.Request.MostUsedChampions) {
        worker.fetchMostFrequentChampions(summonerName: request.summonerName, region: request.region, season: request.season, success: { (data) in
            self.presenter.presentFetchMostUsedChampions(response: data)
        }) { (data) in
            // It seems redundant. Check architecture
            self.presenter.presentFetchMostUsedChampions(response: data)
        }
    }
    
    func fetchSummonerInfo(request: MainModel.Fetch.Request.SummonerInfo) {
        worker.fetchSummonerInfo(summonerName: request.summonerName, region: request.region, success: { (data) in
            self.presenter.presentFetchSummonerInfo(response: data)
        }) { (data) in
            // It seems redundant. Check architecture
            self.presenter.presentFetchSummonerInfo(response: data)
        }
    }
    
    func fetchMatchList(request: MainModel.Fetch.Request.MatchInfoView) {
        worker.fetchMatchHistory(summonerName: request.summonerName, region: request.region, type: request.type, start: request.start, success: { (data) in
            self.presenter.presentFetchMatchList(response: data)
        }) { (data) in
            self.presenter.presentFetchMatchList(response: data)
        }
    }
    
}
