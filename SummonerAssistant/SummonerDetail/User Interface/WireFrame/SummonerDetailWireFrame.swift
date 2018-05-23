//
//  SummonerDetailWireFrame.swift
//  Summoner Assistant
//
//  Created by asierzapata on 05/22/2018.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

class SummonerDetailWireFrame: SummonerDetailWireFrameProtocol {

    class func presentSummonerDetailModule(fromView: AnyObject) {

        // Generating module components
        let view: SummonerDetailViewProtocol = SummonerDetailViewController()
        let presenter: SummonerDetailPresenterProtocol & SummonerDetailInteractorOutputProtocol = SummonerDetailPresenter()
        let interactor: SummonerDetailInteractorInputProtocol = SummonerDetailInteractor()
        let APIDataManager: SummonerDetailAPIDataManagerInputProtocol = SummonerDetailAPIDataManager()
        let localDataManager: SummonerDetailLocalDataManagerInputProtocol = SummonerDetailLocalDataManager()
        let wireFrame: SummonerDetailWireFrameProtocol = SummonerDetailWireFrame()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
    }
}
