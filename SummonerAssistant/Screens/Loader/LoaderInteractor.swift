//
//  LoaderInteractor.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 12/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

protocol LoaderInteractorInput {
    func fetchTopChampionsSummoner(request: LoaderModel.Fetch.Request.MostUsedChampions)
    func fetchSummonerInfo(request: LoaderModel.Fetch.Request.SummonerInfo)
    func fetchMatchList(request: LoaderModel.Fetch.Request.MatchInfoView)
}

class LoaderInteractor: LoaderInteractorInput {
    
    var presenter: LoaderPresenterInput!
    var worker: LoaderWorker!
    
    
    func fetchTopChampionsSummoner(request: LoaderModel.Fetch.Request.MostUsedChampions) {
        worker.fetchMostFrequentChampions(summonerName: request.summonerName, region: request.region, season: request.season, success: { (data) in
            self.presenter.presentFetchMostUsedChampions(response: data)
        }) { (data) in
            // It seems redundant. Check architecture
            self.presenter.presentFetchMostUsedChampions(response: data)
        }
    }
    
    func fetchSummonerInfo(request: LoaderModel.Fetch.Request.SummonerInfo) {
        worker.fetchSummonerInfo(summonerName: request.summonerName, region: request.region, success: { (data) in
            self.presenter.presentFetchSummonerInfo(response: data)
        }) { (data) in
            // It seems redundant. Check architecture
            self.presenter.presentFetchSummonerInfo(response: data)
        }
    }
    
    func fetchMatchList(request: LoaderModel.Fetch.Request.MatchInfoView) {
        worker.fetchMatchHistory(summonerName: request.summonerName, region: request.region, type: request.type, start: request.start, success: { (data) in
            self.presenter.presentFetchMatchList(response: data)
        }) { (data) in
            self.presenter.presentFetchMatchList(response: data)
        }
    }
    
}
