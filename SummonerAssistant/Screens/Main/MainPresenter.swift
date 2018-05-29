//
//  MainPresenter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MainPresenterInput {
    func presentFetchResults(response: MainModel.Fetch.Response)
}

class MainPresenter: MainPresenterInput {
    var viewController: MainViewControllerInput!
    
    func presentFetchResults(response: MainModel.Fetch.Response) {
        let viewModel = MainModel.Fetch.ViewModel(topUsedChampions: response.data, isError: response.isError, message: response.message)
        
        if viewModel.isError {
            if let viewController = self.viewController {
                viewController.errorFetchingItems(viewModel: viewModel)
            }
        } else {
            if let viewController = self.viewController {
                viewController.successFetchedItems(viewModel: viewModel)
            }
        }
    }
}
