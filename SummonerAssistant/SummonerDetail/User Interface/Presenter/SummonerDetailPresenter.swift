//
//  SummonerDetailPresenter.swift
//  Summoner Assistant
//
//  Created by asierzapata on 05/22/2018.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

class SummonerDetailPresenter: SummonerDetailPresenterProtocol, SummonerDetailInteractorOutputProtocol {
    weak var view: SummonerDetailViewProtocol?
    var interactor: SummonerDetailInteractorInputProtocol?
    var wireFrame: SummonerDetailWireFrameProtocol?

    init() {}
}
