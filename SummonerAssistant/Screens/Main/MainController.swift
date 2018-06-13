//
//  MainController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var AppStateController: AppStateController!
    var router: MainRouter!
    
    var summonerName: String!
    
    // Labels
    @IBOutlet weak var SummonerNameLabel: UILabel!
    @IBOutlet weak var SummonerLevelLabel: UILabel!
    
    // Images
    @IBOutlet weak var FirstUsedChampionImage: UIImageView!
    @IBOutlet weak var SecondUsedChampionImage: UIImageView!
    @IBOutlet weak var ThirdUsedChampionImage: UIImageView!
    @IBOutlet weak var SummonerAvatar: UIImageView!
    
    var UsedChampionsImages: Array<UIImageView>!
    
    // Lists
    @IBOutlet weak var MatchHistoryList: UITableView!
    
    
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

        let router = MainRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScreen(segue: segue)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        UsedChampionsImages = [
            FirstUsedChampionImage,
            SecondUsedChampionImage,
            ThirdUsedChampionImage
        ]
        presentSummonerInfo()
        presentMatchList()
        presentMostUsedChampions()
    }
    
    func presentMostUsedChampions() {
        let topUsedChampions = AppStateController.mostFrequentChampionsArray
        for n in 0...2 {
            ImageService.getImage(withURL: URL(string: topUsedChampions[n].thumbnailUrl)!) { image in
                self.UsedChampionsImages[n].image = image
            }
        }
    }
    
    func presentMatchList() {
    }
    
    func presentSummonerInfo() {
        let summoner = AppStateController.summoner
        SummonerNameLabel.text = summoner.name
        SummonerLevelLabel.text = String(summoner.summonerLevel)
        ImageService.getImage(withURL: URL(string: summoner.profileIconThumbnail)!) { image in
            self.SummonerAvatar.image = image
        }
    }
    
    // MARK: - UITableView Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppStateController.matchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let match = AppStateController.matchList[indexPath.row]
        cell.MatchContainer.backgroundColor = (match.isWin == 1 ? UIColor.green : UIColor.red)
        
        ImageService.getImage(withURL: URL(string: "https:\(match.championData.imageUrl)")!, resolve: { image in
            cell.ChampionAvatar.image = image
        })
        
        let firstSummoner = match.spells[0] as! Dictionary<String,String>
        let secondSummoner = match.spells[1] as! Dictionary<String,String>
        
        ImageService.getImage(withURL: URL(string: "https:\(firstSummoner["imageUrl"]!)")!, resolve: { image in
            cell.FirstSummoner.image = image
        })
        ImageService.getImage(withURL: URL(string: "https:\(secondSummoner["imageUrl"]!)")!, resolve: { image in
            cell.SecondSummoner.image = image
        })
        ImageService.getImage(withURL: URL(string: "https:\(match.firstRune)")!, resolve: { image in
            cell.MainRune.image = image
        })
        ImageService.getImage(withURL: URL(string: "https:\(match.secondRune)")!, resolve: { image in
            cell.SecondRune.image = image
        })

        cell.ChampionLevel.text = "Level \(String(match.championData.level))"
        
        cell.MatchType.text = match.gameType
        cell.TimeCreated.text = "\(String(match.timeCreated))"
        cell.TotalTime.text = String(match.gameLength)
        cell.KillStreak.text = match.gameStats.largestMultiKillString
        
        cell.MMR.text = "MMR \(String(match.mmr))"
        cell.KDAString.text = "\(match.gameStats.kills)/\(match.gameStats.deaths)/\(match.gameStats.assists)"
        cell.KDAAverage.text = match.gameStats.KDA.components(separatedBy: ":")[0]
        cell.CS.text = "CS \(String(match.gameStats.cs))"
        cell.KillParticipation.text = match.gameStats.killContribution
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // MARK: - Tap gesture handler
    
    @IBAction func topChampionsTapped(_ sender: UITapGestureRecognizer) {
        print(">>>>> Tapped")
        router.showMostFrequentChampions()
    }
}
