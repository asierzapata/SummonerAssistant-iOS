//
//  MainInteractor.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MainInteractorInput {
    func fetchTopChampionsSummoner(request: MainModel.Fetch.Request)
}

class MainInteractor: MainInteractorInput {
    
    var presenter: MainPresenterInput!
    var worker: MainWorker!
    
    func fetchTopChampionsSummoner(request: MainModel.Fetch.Request) {
        worker = MainWorker()
        worker.fetch(summonerName: request.summonerName, region: request.region, season: request.season, success: { (data) in
            self.presenter.presentFetchResults(response: data)
        }) { (data) in
            // It seems redundant. Check architecture
            self.presenter.presentFetchResults(response: data)
        }
    }
    
}
