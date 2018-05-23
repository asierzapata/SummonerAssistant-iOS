//
//  SummonerDetailInteractor.swift
//  Summoner Assistant
//
//  Created by asierzapata on 05/22/2018.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

class SummonerDetailInteractor: SummonerDetailInteractorInputProtocol {

    weak var presenter: SummonerDetailInteractorOutputProtocol?
    var APIDataManager: SummonerDetailAPIDataManagerInputProtocol?
    var localDatamanager: SummonerDetailLocalDataManagerInputProtocol?

    init() {}
}
