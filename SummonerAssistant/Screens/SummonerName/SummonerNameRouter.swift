//
//  SummonerNameRouter.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation
import UIKit

protocol SummonerNameRouterInput {
    func showMain()
}

class SummonerNameRouter: SummonerNameRouterInput {
    
    var viewController: SummonerNameController!
    
    func showMain() {
        viewController.performSegue(withIdentifier: "main", sender: nil)
    }
    
    func passDataToNextScreen(segue: UIStoryboardSegue) {
        if segue.identifier == "main" {
            let destinationVC = segue.destination as! MainViewController
            let sourceVC = segue.source as! SummonerNameController
            destinationVC.summonerName = sourceVC.summonerName.text
            destinationVC.AppStateController = AppStateController()
        }
    }
}
