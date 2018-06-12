//
//  LoaderPresenter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 12/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//


protocol LoaderPresenterInput {
    func presentFetchMostUsedChampions(response: LoaderModel.Fetch.Response)
    func presentFetchSummonerInfo(response: LoaderModel.Fetch.Response)
    func presentFetchMatchList(response: LoaderModel.Fetch.Response)
}

class LoaderPresenter: LoaderPresenterInput {
    var viewController: LoaderViewControllerInput!
    
    func presentFetchMostUsedChampions(response: LoaderModel.Fetch.Response) {
        if response.isError {
            if let viewController = self.viewController {
                viewController.errorFetchingItems(error: AppError(message: response.message!))
            }
        } else {
            let viewModel = LoaderModel.Fetch.ViewModel.MostUsedChampions(topUsedChampions: response.data as! Array<ChampionsStatisticsModel>, isError: response.isError, message: response.message)
            
            if let viewController = self.viewController {
                viewController.successFetchMostUsedChampions(viewModel: viewModel)
            }
        }
    }
    
    func presentFetchSummonerInfo(response: LoaderModel.Fetch.Response) {
        if response.isError {
            if let viewController = self.viewController {
                viewController.errorFetchingItems(error: AppError(message: response.message!))
            }
        } else {
            let viewModel = LoaderModel.Fetch.ViewModel.SummonerInfoView(info: response.data as! SummonerInfo, isError: response.isError, message: response.message)
            
            if let viewController = self.viewController {
                viewController.successSummonerInfo(viewModel: viewModel)
            }
        }
    }
    
    func presentFetchMatchList(response: LoaderModel.Fetch.Response) {
        if response.isError {
            if let viewController = self.viewController {
                viewController.errorFetchingItems(error: AppError(message: response.message!))
            }
        } else {
            let viewModel = LoaderModel.Fetch.ViewModel.MatchInfoView(matchList: response.data as! Array<MatchInfoModel>, isError: response.isError, message: response.message)
            
            if let viewController = self.viewController {
                viewController.successFetchMatchList(viewModel: viewModel)
            }
        }
    }
}
