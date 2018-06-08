//
//  MFCRouter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 31/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MFCRouterInput {
    func showMain()
    func showChampionStatsDetail()
}

class MFCRouter: MFCRouterInput {
    weak var viewController: MFCViewController!
    
    func showMain() {
        viewController.performSegue(withIdentifier: "main", sender: nil)
    }
    
    func showChampionStatsDetail() {
        viewController.performSegue(withIdentifier: "championStatsDetail", sender: nil)
    }
    
    func passDataToNextScreen(segue: UIStoryboardSegue) {
        if segue.identifier == "main" {
            let destinationVC = segue.destination as! MainViewController
            let sourceVC = segue.source as! MFCViewController
            destinationVC.mostFrequentChampionsArray = sourceVC.data
        }
        if segue.identifier == "championStatsDetail" {
//            let destinationVC = segue.destination as! MFCViewController
//            let sourceVC = segue.source as! MainViewController
//            destinationVC.data = sourceVC.mostFrequentChampionsArray
        }
    }
}
