//
//  ChampionStatsDetailRouter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation
import UIKit

protocol ChampionStatsDetailRouterInput {
    func showMostFrequentChampion()
}

class ChampionStatsDetailRouter: ChampionStatsDetailRouterInput {
    
    var viewController: ChampionStatsDetailController!
    
    func showMostFrequentChampion () {
        viewController.performSegue(withIdentifier: "mostFrequentChampions", sender: nil)
    }
    
    func passDataToNextScreen(segue: UIStoryboardSegue) {
        if segue.identifier == "mostFrequentChampions" {
            let destinationVC = segue.destination as! MFCViewController
            let sourceVC = segue.source as! ChampionStatsDetailController
            destinationVC.AppStateController = sourceVC.AppStateController
        }
    }
}
