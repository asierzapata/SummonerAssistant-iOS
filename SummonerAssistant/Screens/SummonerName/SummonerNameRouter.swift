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
    func showLoader()
}

class SummonerNameRouter: SummonerNameRouterInput {
    
    var viewController: SummonerNameController!
    
    func showLoader() {
        viewController.performSegue(withIdentifier: "loader", sender: nil)
    }
    
    func passDataToNextScreen(segue: UIStoryboardSegue) {
        if segue.identifier == "loader" {

        }
    }
}
