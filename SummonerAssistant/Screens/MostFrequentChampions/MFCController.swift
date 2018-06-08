//
//  MFCController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 31/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MFCControllerInput: class {
    
}

class MFCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFCControllerInput {
    var data: Array<ChampionsStatisticsModel> = []
    
    var router: MFCRouter!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    // MARK: - Object lifecycle
    
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
        let router = MFCRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    // MARK: - UITableView Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let championStats = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChampionCell", for: indexPath) as! ChampionStatsTableViewCell
        // Custom Cell data setting here
        
        // Vars
        let averageKDA = (championStats.kill + championStats.assist) / championStats.death
        let wins = CGFloat(Double(championStats.gamesWon)!)
        let loses = CGFloat(Double(championStats.gamesLost)!)
        cell.ChampionName.text = championStats.name
        cell.WinRate.text = championStats.winrate
        cell.WinRateBarRatio.setMultiplier(multiplier: wins/loses)
        cell.KDARaw.text = "\(championStats.kill)/\(championStats.death)/\(championStats.assist)"
        cell.KDAAvg.text = "\(Double(round(1000*averageKDA)/1000)):1"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
