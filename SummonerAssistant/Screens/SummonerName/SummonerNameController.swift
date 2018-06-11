//
//  SummonerNameController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation
import UIKit

class SummonerNameController: UIViewController {
    
    var router: SummonerNameRouter!
    
    @IBOutlet weak var summonerName: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
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
        let router = SummonerNameRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScreen(segue: segue)
    }
    
    @IBAction func send(_ sender: UIButton) {
        UserService.updateSummonerName(summoner: summonerName.text!)
        router.showMain()
    }
}
