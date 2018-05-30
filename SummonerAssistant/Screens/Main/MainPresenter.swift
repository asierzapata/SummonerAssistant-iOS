//
//  MainPresenter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MainPresenterInput {
    func presentFetchMostUsedChampions(response: MainModel.Fetch.Response)
    func presentFetchSummonerInfo(response: MainModel.Fetch.Response)
}

class MainPresenter: MainPresenterInput {
    var viewController: MainViewControllerInput!
    
    func presentFetchMostUsedChampions(response: MainModel.Fetch.Response) {
        if response.isError {
            if let viewController = self.viewController {
                viewController.errorFetchingItems(error: AppError(message: response.message!))
            }
        } else {
            let viewModel = MainModel.Fetch.ViewModel.MostUsedChampions(topUsedChampions: response.data as! Array<ChampionsStatisticsModel>, isError: response.isError, message: response.message)
            
            if let viewController = self.viewController {
                viewController.successFetchMostUsedChampions(viewModel: viewModel)
            }
        }
    }
    
    func presentFetchSummonerInfo(response: MainModel.Fetch.Response) {
        if response.isError {
            if let viewController = self.viewController {
                viewController.errorFetchingItems(error: AppError(message: response.message!))
            }
        } else {
            let viewModel = MainModel.Fetch.ViewModel.SummonerInfoView(info: response.data as! SummonerInfo, isError: response.isError, message: response.message)

            if let viewController = self.viewController {
                viewController.successSummonerInfo(viewModel: viewModel)
            }
        }
    }
}
