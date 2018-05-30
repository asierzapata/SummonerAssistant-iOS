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

class MainViewController: UIViewController, MainViewControllerInput {
    
    var interactor: MainInteractor!
    var router: MainRouter!
    
    // Labels
    @IBOutlet weak var SummonerNameLabel: UILabel!
    @IBOutlet weak var SummonerLevelLabel: UILabel!
    
    // Images
    @IBOutlet weak var FirstUsedChampionImage: UIImageView!
    @IBOutlet weak var SecondUsedChampionImage: UIImageView!
    @IBOutlet weak var ThirdUsedChampionImage: UIImageView!
    @IBOutlet weak var SummonerAvatar: UIImageView!
    
    var UsedChampionsImages: Array<UIImageView>!
    
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
        //interactor.fetchTopChampionsSummoner(request: MainModel.Fetch.Request.MostUsedChampions(summonerName: "20361724", region: "euw", season: "7"))
        interactor.fetchSummonerInfo(request: MainModel.Fetch.Request.SummonerInfo(summonerName: "DogeCarry", region: "euw"))
    }
    
    func successFetchMostUsedChampions(viewModel: MainModel.Fetch.ViewModel.MostUsedChampions) {
        print(viewModel.topUsedChampions)
        for n in 1...3 {
            let url = URL(string: viewModel.topUsedChampions[n].thumbnailUrl!)
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
    
}
