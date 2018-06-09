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
        let averageKDA = (championStats.kills + championStats.assists) / championStats.deaths
        let wins = Double(championStats.gamesWon)
        let loses = Double(championStats.gamesLost)
        let ratio = wins / (wins + loses)
        cell.ChampionName.text = championStats.name
        cell.WinRate.text = "\(championStats.winrate)%"
        print(CGFloat(Double(cell.WinRateBar.frame.size.width) * ratio),cell.WinRateBar.frame.size.width)
        cell.WinBarWidth.constant = CGFloat(Double(cell.WinRateBar.frame.size.width) * ratio)
        cell.KDARaw.text = "\(championStats.kills)/\(championStats.deaths)/\(championStats.assists)"
        cell.KDAAvg.text = "\(Double(round(1000*averageKDA)/1000)):1"
        ImageService.getImage(withURL: URL(string: championStats.thumbnailUrl)!) { image in
            cell.ChampionAvatar.image = image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
