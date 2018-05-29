//
//  MainRouter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MainRouterInput {
    func showMatchDetail()
}

class MainRouter: MainRouterInput {
    weak var viewController: MainViewController!
    var dataStore: MainInteractor?
    
    func showMatchDetail() {
        // Here we will perfom a segue
        viewController.performSegue(withIdentifier: "matchDetail", sender: nil)
    }
    
    func passDataToNextScreen(segue: UIStoryboardSegue) {
        if segue.identifier == "matchDetail" {

        }
    }
}