//
//  MainController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MainViewControllerInput: class {
    func successFetchMostUsedChampions(viewModel: MainModel.Fetch.ViewModel.MostUsedChampions)
    func successSummonerInfo(viewModel: MainModel.Fetch.ViewModel.SummonerInfoView)
    func errorFetchingItems(error: AppError)
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainViewControllerInput {
    
    var interactor: MainInteractor!
    var router: MainRouter!
    
    var matchList = ["win", "lost"]
    
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
        let interactor = MainInteractor()
        let worker = MainWorker()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
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
        interactor.fetchTopChampionsSummoner(request: MainModel.Fetch.Request.MostUsedChampions(summonerName: "20361724", region: "euw", season: "7"))
        interactor.fetchSummonerInfo(request: MainModel.Fetch.Request.SummonerInfo(summonerName: "DogeCarry", region: "euw"))
    }
    
    func successFetchMostUsedChampions(viewModel: MainModel.Fetch.ViewModel.MostUsedChampions) {
        print(viewModel.topUsedChampions)
        for n in 1...3 {
            let url = URL(string: viewModel.topUsedChampions[n].thumbnailUrl)
            let data = try? Data(contentsOf: url!)
            UsedChampionsImages[n].image = UIImage(data: data!)
            roundImageView(image: UsedChampionsImages[n])
        }
    }
    
    func successSummonerInfo(viewModel: MainModel.Fetch.ViewModel.SummonerInfoView) {
        print(viewModel.info)
        let url = URL(string: viewModel.info.profileIconThumbnail)
        let data = try? Data(contentsOf: url!)
        
        SummonerNameLabel.text = viewModel.info.name
        SummonerLevelLabel.text = String(viewModel.info.summonerLevel)
        SummonerAvatar.image = UIImage(data: data!)
        roundImageView(image: SummonerAvatar)
    }
    
    func roundImageView(image: UIImageView){
        image.layer.cornerRadius = image.frame.size.width / 2;
        image.clipsToBounds = true;
    }
    
    func errorFetchingItems(error: AppError) {
        print(error.message)
    }
    
    // MARK: - UITableView Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.KDA.text = "4/0/3";
        cell.MatchContainer.backgroundColor = (matchList[indexPath.row] == "win" ? UIColor.green : UIColor.red)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
//    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
}
