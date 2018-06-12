//
//  LoaderRouter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 12/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol LoaderRouterInput {
    func showSummonerPicker()
    func showMain()
}

class LoaderRouter: LoaderRouterInput {
    
    weak var viewController: LoaderController!
    var dataStore: LoaderInteractor?
    
    func showMain() {
        viewController.performSegue(withIdentifier: "main", sender: nil)
    }
    
    func showSummonerPicker() {
        viewController.performSegue(withIdentifier: "summonerPicker", sender: nil)
    }
    
    func passDataToNextScreen(segue: UIStoryboardSegue) {
        if segue.identifier == "main" {
            let destinationVC = segue.destination as! MainViewController
            let sourceVC = segue.source as! LoaderController
            destinationVC.AppStateController = sourceVC.appStateController
        }
        if segue.identifier == "summonerPicker" {
            print("it is")
        }
    }
    
}
