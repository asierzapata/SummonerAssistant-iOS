//
//  LoaderController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 12/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol LoaderViewControllerInput: class {
    func successFetchMostUsedChampions(viewModel: LoaderModel.Fetch.ViewModel.MostUsedChampions)
    func successSummonerInfo(viewModel: LoaderModel.Fetch.ViewModel.SummonerInfoView)
    func successFetchMatchList(viewModel: LoaderModel.Fetch.ViewModel.MatchInfoView)
    func errorFetchingItems(error: AppError)
}

class LoaderController: UIViewController, LoaderViewControllerInput {
    
    var appStateController: AppStateController!
    var router: LoaderRouter!
    var interactor: LoaderInteractor!
    
    var spinner: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoaderInteractor()
        let worker = LoaderWorker()
        let presenter = LoaderPresenter()
        let router = LoaderRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        appStateController = AppStateController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScreen(segue: segue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaySpinner()
        UserService.getSummonerName(resolve: { summonerName, region in
            self.interactor.fetchSummonerInfo(request: LoaderModel.Fetch.Request.SummonerInfo(summonerName: summonerName, region: region))
        }) {
            DispatchQueue.main.async {
                self.router.showSummonerPicker()
            }
        }
    }
    
    func displaySpinner() {
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        view.addSubview(spinner)

        spinner.startAnimating()
    }
    
    func removeSpinner() {
        spinner.stopAnimating()
    }
    
    func successFetchMostUsedChampions(viewModel: LoaderModel.Fetch.ViewModel.MostUsedChampions) {
        appStateController.mostFrequentChampionsArray = viewModel.topUsedChampions
        interactor.fetchMatchList(request: LoaderModel.Fetch.Request.MatchInfoView(region: appStateController.summoner.region!, summonerName: appStateController.summoner.name, type: "ranked", start: "0"))
    }
    
    func successFetchMatchList(viewModel: LoaderModel.Fetch.ViewModel.MatchInfoView) {
        appStateController.matchList = viewModel.matchList
        finishedLoading()
    }
    
    func successSummonerInfo(viewModel: LoaderModel.Fetch.ViewModel.SummonerInfoView) {
        appStateController.summoner = viewModel.info
        interactor.fetchTopChampionsSummoner(request: LoaderModel.Fetch.Request.MostUsedChampions(summonerName: String(appStateController.summoner.id) , region: appStateController.summoner.region!, season: appStateController.season))
    }
    
    func errorFetchingItems(error: AppError) {
        print(error.message)
    }
    
    func finishedLoading() {
        removeSpinner()
        router.showMain()
    }
    
}
